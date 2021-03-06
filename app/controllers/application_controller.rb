class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
  end
  helper_method :current_user

  def my_photo
    graph = Koala::Facebook::API.new(current_user.oauth_token)
    u = graph.get_object("me")
    @my_photo ||= graph.get_picture(u["id"],type: :large)
  end
  helper_method :my_photo

  def friends
    graph = Koala::Facebook::API.new(current_user.oauth_token)
    u = graph.get_object("me")
    @friends = graph.get_connections(u["id"],"friends?fields=id,name,picture.type(small)")
  end
  helper_method :friends

end
