class FriendsController < ApplicationController
  def show
    graph = Koala::Facebook::API.new(current_user.oauth_token)
    u = graph.get_object("me")
    @friends = graph.get_connections(u["id"],"friends?fields=id,name,picture.type(small)")

  end
end
