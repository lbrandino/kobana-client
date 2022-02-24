Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pixs#index"
  resources :pixs do
     member do
        put 'cancel'
     end 
  end
end
