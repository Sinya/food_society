class FriendsController < ApplicationController
  def show
    graph = Koala::Facebook::API.new(current_user.oauth_token)
    u = graph.get_object("me")
    @friends = graph.get_connections(u["id"],"friends")

    @my_photo = graph.get_picture(u["id"])


	@friends_photo = graph.get_connections("me", "friends?fields=id,name,picture.type(large)")


  end
end
