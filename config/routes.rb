HCEF::Application.routes.draw do

  resources :after_schools
  match "/after_schools/update_by_id/:id" => "after_schools#update_by_id", via: :post
  resources :programs
  resources :locations
  resources :schools
  resources :children
  resources :guardians
  resources :instructors
  resources :sessions

  get 'home' => 'static#home'
  root :to => 'static#beta'

  get 'create_child' => 'static#create_child'

  #User routes (login, logout, signup...)
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
 
end
