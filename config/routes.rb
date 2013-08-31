Olac::Application.routes.draw do
  root :to => 'home#index'

 #root  get "home/index"

  get "assets/index", :as => :ember

  resources :records
  resources :notes
  resources :annotations
  resources :comments
  
  get "review", to: "review#index"
  post "review", to: "review#search"
  
end
