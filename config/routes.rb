Bbwifi::Application.routes.draw do

  resources :stores do
    get '/login' => 'stores#login',:as => 'login'
  end


  resources :clients
  resources :advertisements
  devise_for :store_managers
  authenticated :store_manager do
    root :to => "home#index"
  end
  devise_scope :store_manager do
    root :to => "devise/sessions#new" 
  end
end
