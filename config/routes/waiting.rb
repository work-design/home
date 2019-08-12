Rails.application.routes.draw do

  scope module: 'waiting' do
    resources :spaces
  end

  scope :my, module: 'waiting/my', as: :my do
    root to: '/auth/mine/users#show', as: :root

    resource :roles
    resources :spaces
    resources :logs
    resources :duties
    resources :order_items
    resources :workers do
      post 'current', on: :collection
      patch 'present', on: :member
    end
  end

  scope :admin, module: 'waiting/admin', as: 'admin' do
    root to: '/auth/admin/users#index'
    resources :managers do
      get 'user' => :edit_user, on: :member
      patch 'user' => :update_user, on: :member
    end
    resources :space_taxons
    resources :posts
  end

end
