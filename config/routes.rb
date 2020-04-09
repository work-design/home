Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :schedules

  controller :home do
    get :index
    get :yh
  end

  controller :oauth do
    match '/auth/alipay', action: 'alipay', via: [:get, :post]
  end

  namespace :admin do
    root 'home#index'
    resources :requirements
    resources :escorts
  end
  namespace :my do
    resources :requirements do
      collection do
        get :list
        get :picked
      end
      member do
        patch :pickup
        patch :done
      end
    end
    resources :escorts do
      collection do
        get :list
        get :picked
      end
      member do
        patch :pickup
        patch :done
      end
    end
  end

  constraints ->(req) { AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user if req.env['rack.session'].present? } do
    get '' => 'bench/my/tasks#index'
  end
  root to: 'home#index'

  require 'sidekiq/web'
  constraints ->(req) { AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user&.admin? if req.env['rack.session'].present? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount ActionCable.server => '/cable'

end
