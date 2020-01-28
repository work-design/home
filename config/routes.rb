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
    resources :requirements
  end
  namespace :my do
    resources :requirements do
      patch :pickup, on: :member
    end
  end

  # constraints ->(req) { AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user if req.env['rack.session'].present? } do
  #   get '' => 'bench/my/tasks#index'
  # end
  require 'sidekiq/web'
  constraints ->(req) { AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user&.admin? if req.env['rack.session'].present? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'home#index'

  mount ActionCable.server => '/cable'

end
