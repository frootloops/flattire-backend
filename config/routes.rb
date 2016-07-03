Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'auth/send_code', to: 'auth#index'
      post 'auth/sign_in', to: 'auth#index'
      post 'auth/log_out', to: 'auth#index'
    end
  end
end
