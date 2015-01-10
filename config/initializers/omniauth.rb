OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, '641910022603696', 'cd56f2b94b3a589157bff212e2517b7b', :scope => 'email,user_birthday,read_stream, user_friends', :display => 'popup'
	provider :facebook, ENV["APP_ID"], ENV["APP_SECRET"], :scope => 'email,user_birthday,read_stream, user_friends, user_status, user_activities, user_events, manage_notifications, manage_pages, publish_actions, rsvp_event', :display => 'popup'
end
