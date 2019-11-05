Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :schedules
  
  controller :home do
    get :index
    get :uptoken
  end

  controller :oauth do
    match '/auth/alipay', action: 'alipay', via: [:get, :post]
  end
  
  namespace :admin do
    root 'home#index'
    resources :posts
  end

  constraints(->(req){ User.find_by(id: req.env['rack.session']['user_id']) if req.env['rack.session'].present? }) do
    #root to: 'bench/my/tasks#index'
  end
  require 'sidekiq/web'
  constraints ->(req) { AuthorizedToken.find_by(token: req.env["rack.session"]["auth_token"])&.user&.admin? if req.env["rack.session"].present? } do
    mount Sidekiq::Web => "/sidekiq"
  end
  
  root to: 'home#index'

  mount ActionCable.server => '/cable'

end
