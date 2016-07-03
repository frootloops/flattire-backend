SimpleTokenAuthentication.configure do |config|
  config.identifiers = { driver: :authentication_token }
  config.header_names = { driver: { authentication_token: 'X-Driver-Token' } }
  config.skip_devise_trackable = true
end

