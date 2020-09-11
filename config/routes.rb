Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :schedules

  controller :home do
    get :index
  end

  controller :oauth do
    match '/auth/alipay', action: 'alipay', via: [:get, :post]
  end

  namespace :admin do
    root 'home#index'
  end
  namespace :panel do
    root 'home#index'
  end
  namespace :board do
    root '/auth/board/users#show'
  end
  namespace :my do
    root 'home#index'
  end
  namespace :me do
    root 'home#index'
  end

  scope :my, module: 'waiting/my', as: :my do
    resource :roles
    resources :logs
    resources :order_items
  end

  scope module: 'facility' do
    resources :facilitates, only: [:index, :show]
  end

  scope :admin, module: 'facility/admin', as: :admin do
    resources :facilitate_taxons, except: [:index, :show]
    resources :facilitates
  end

  scope :my, module: 'facility/my', as: :my do
    resources :facilitates, only: [] do
      put :order, on: :member
    end
  end

  constraints ->(req) { AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user if req.env['rack.session'].present? } do
    get '' => 'bench/board/tasks#index'
  end
  root to: 'home#index'

  require 'sidekiq/web'
  constraints ->(req) { AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user&.admin? if req.env['rack.session'].present? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount ActionCable.server => '/cable'

end
