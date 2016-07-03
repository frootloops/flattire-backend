SimpleTokenAuthentication.configure do |config|
  config.header_names = { driver: { authentication_token: "X-Driver-Token" } }
  config.skip_devise_trackable = true
end

