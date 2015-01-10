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

  # private

  def create_params
    params.require(:food).permit(:name, :category, :due)
  end

end