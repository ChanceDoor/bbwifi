Bbwifi::Application.routes.draw do

  resources :stores do
    get '/login' => 'stores#login',:as => 'login'
    post '/sign_in' => 'stores#sign_in',:as => 'sign_in'
  end

  devise_for :clients, :controllers =>{:sessions => "admins/sessions"}
  resources :advertisements
  devise_for :store_managers
  authenticated :store_manager do
    root :to => "home#index"
  end
  devise_scope :store_manager do
    root :to => "devise/sessions#new" 
  end
end
