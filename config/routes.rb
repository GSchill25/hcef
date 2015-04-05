HCEF::Application.routes.draw do

  resources :after_schools
  match "/after_schools/update_by_id/:id" => "after_schools#update_by_id", via: :post
  match "/after_schools/update_sign_in_by_id/:id" => "after_schools#update_sign_in_by_id", via: :post
  resources :programs
  resources :locations
  resources :schools
  resources :children
  resources :guardians
  resources :instructors
  resources :sessions
  resources :sub_locations

  get 'home' => 'static#beta'
  get 'master_view' => 'static#home'
  get 'master_view_new' => 'static#master_view_new'
  root :to => 'static#beta'

  get 'create_child' => 'static#create_child'

  #User routes (login, logout, signup...)
  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
 
end
