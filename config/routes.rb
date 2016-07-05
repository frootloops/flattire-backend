Rails.application.routes.draw do
  devise_for :drivers
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'token/request', to: 'token#send_code'
      post 'token',         to: 'token#check_code'
      post 'location',      to: 'location#update'

      get 'requests', to: 'request#index'
      post 'requests', to: 'request#create'
      post 'requests/:id/done', to: 'request#done'
      post 'requests/:id/cancel', to: 'request#cancel'

      get 'me', to: 'driver#me'
    end
  end
end
