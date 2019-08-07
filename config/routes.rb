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

  constraints(->(req){ User.find_by(id: req.env['rack.session']['user_id']) if req.env['rack.session'].present? }) do
    #root to: 'bench/my/tasks#index'
  end
  root to: 'home#index'

  mount ActionCable.server => '/cable'

end
