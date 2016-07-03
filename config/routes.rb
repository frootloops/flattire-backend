Rails.application.routes.draw do
  devise_for :drivers
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'auth/send_code', to: 'auth#send_code'
      post 'auth/sign_in',   to: 'auth#log_in'
      post 'auth/log_out',   to: 'auth#log_out'
      get 'auth/hello',      to: 'auth#hello'
      post 'location',       to: 'location#update'

      get 'requests', to: 'request#index'
      post 'requests', to: 'request#create'
      post 'requests/cancel', to: 'request#cancel'
    end
  end
end
