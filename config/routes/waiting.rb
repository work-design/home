Rails.application.routes.draw do

  

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

  

end
