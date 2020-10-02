Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :omniauth_callbacks => 'users/omniauth_callbacks'
    
   }
  resources :contacts, only: [:new, :create] do
  end

  root to: "posts#index"
  resources :posts, only: [:index, :new, :create] do
    
    collection do
      get :aisyo_soldier
      get :aisyo_wizard
      get :aisyo_monk
      get :aisyo_fighter
      get :aisyo_gunner
      get :about
    end
    member do
      get :my_soldier
      get :my_wizard
      get :my_monk
      get :my_fighter
      get :my_gunner
      
    end
  end
  
end
