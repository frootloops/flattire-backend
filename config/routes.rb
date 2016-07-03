Rails.application.routes.draw do
  devise_for :drivers
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'auth/send_code', to: 'auth#send_code'
      post 'auth/sign_in', to: 'auth#index'
      post 'auth/log_out', to: 'auth#index'
      get 'auth/hello', to: 'auth#hello'
    end
  end
end
