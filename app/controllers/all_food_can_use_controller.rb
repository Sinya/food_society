class AllFoodCanUseController < ApplicationController
  def show

  	graph = Koala::Facebook::API.new(current_user.oauth_token)
	u = graph.get_object("me")
	@friends = graph.get_connections(u["id"],"friends")
	# Rails.logger.debug("friends: #{@friends}")
	@friend_and_me_food = Food.where(uid: current_user.uid)


	@friends.each do |f|
		lf = Food.where(uid: f["id"])
		@friend_and_me_food.concat(lf)

  	end

  	str = @friend_and_me_food.pluck(:name).map(&:inspect).join(',')
  	Rails.logger.debug("str--------#{str}")

  	num = Random.rand(8)

	  	@output = IcookRecipe.solr_search do
	  	 fulltext "#{str}" do
	  	     query_phrase_slop 1
	  	     minimum_match num
	  	 end
	  	end

	  	@output.results.each do |result|
			Rails.logger.debug("Recipe: #{result.match_ingredient}")
			Rails.logger.debug("num: #{num}")
		end

	# @recommend_recipe = IcookRecipe.where("match_ingredient LIKE ?", "%#{@friend_and_me_food.pluck(:name)}%")
	# @recommend_recipe = IcookRecipe.where("match_ingredient LIKE ?", "%油%" )
	# @recommend_recipe = IcookRecipe.where("match_ingredient REGEXP ?", @friend_and_me_food.pluck(:name).join('|') )

	# Rails.logger.debug("Recipe: #{@recommend_recipe}")

  end

  def search
	u = graph.get_object("me")
	@friends = graph.get_connections(u["id"],"friends")
	Rails.logger.debug("friends: #{@friends}")
	@friend_and_me_food = Food.where(uid: current_user.uid)


	@friends.each do |f|
		lf = Food.where(uid: f["id"])
		@friend_and_me_food.concat(lf)
	end

	# @recommend_recipe = IcookRecipe.where(["#{match_ingredient} ILIKE ?", "%#{@friend_and_me_food}%"])
	# Rails.logger.debug("friends: #{@recommend_recipe}")


  end

end
