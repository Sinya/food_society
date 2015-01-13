class FoodsController < ApplicationController
  
  def index
    @foods = Food.from_food_list(current_user).order('due ASC')
    @ingredient = Ingredient.first.name
  end

  def new
    @foods = Food.from_food_list(current_user).order('due ASC')

    @food = Food.new(params[:food])
    # @food.user_id = current_user.uid
    @food.uid = current_user.uid
    @foods_grains = Dir["public/assets/category/grains/*.png"].map { |f| f.sub('public','') }
    @foods_dairy = Dir["public/assets/category/dairy/*.png"].map { |f| f.sub('public','') }
    @foods_fruits = Dir["public/assets/category/fruits/*.png"].map { |f| f.sub('public','') }
    @foods_meatandbean = Dir["public/assets/category/meatandbean/*.png"].map { |f| f.sub('public','') }
    @foods_vegetables = Dir["public/assets/category/vegetables/*.png"].map { |f| f.sub('public','') }
    @foods_others = Dir["public/assets/category/others/*.png"].map { |f| f.sub('public','') }
  end

  def create
    @food = Food.new(create_params) 
    # @food.user_id = current_user.uid
    @food.uid = current_user.uid

    if @food.save
      flash[:success] = "Food successfully"
      redirect_to new_food_path
    else
      render "new"
    end
  end

  def destroy
  end

  def show
    @ingredients = Ingredient.all
  end

  def ask_for_food
    @ask = params[:myform][:comments]
    render :text => @ask 
  end

  def add_food
    @data = params[:_json]
    @data.each do |d|
      d.each do |key, val|
        Food.create(uid: current_user.uid, category: key, name: val )
        Rails.logger.debug("data: #{key} and #{val}")  
      end
      # @food.uid = current_user.uid
    end
    render json: nil, status: :ok
  end

  # private

  def create_params
    params.require(:food).permit(:name, :category, :due)
  end

end