class AllFoodCanUseController < ApplicationController
  def show

  	graph = Koala::Facebook::API.new(current_user.oauth_token)
	u = graph.get_object("me")
	@friends = graph.get_connections(u["id"],"friends")
	@friend_and_me_food = Food.where(uid: current_user.uid)


	@friends.each do |f|
		lf = Food.where(uid: f["id"])
		@friend_and_me_food.concat(lf)
  	end

  end
end
