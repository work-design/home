Rails.application.routes.draw do

  scope module: 'facility' do
    resources :facilitates, only: [:index, :show]
  end

  scope :admin, module: 'facility/admin', as: 'admin' do
    resources :facilitate_taxons, except: [:index, :show]
    resources :facilitates
  end

  scope :my, module: 'facility/my', as: :my do
    resources :facilitates, only: [] do
      put :order, on: :member
    end
  end

end
