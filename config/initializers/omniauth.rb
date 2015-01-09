OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '641910022603696', 'cd56f2b94b3a589157bff212e2517b7b', :scope => 'email,user_birthday,read_stream, user_friends', :display => 'popup'
end
