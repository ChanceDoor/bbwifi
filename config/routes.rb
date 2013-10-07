Bbwifi::Application.routes.draw do

  devise_for :admins,:controllers => {:sessions => "admins/sessions"}
  authenticated :admin do
    match "/admin", :to => "admins#index", :as => 'admin_root'
    delete "/store_manager/:id(.:format)",:to => "admins#destroy_store_manager", :as => 'store_manager'
  end
  devise_scope :admin do
    match "/admin" => "admins/sessions#new",:as => 'admin_root'
  end

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
