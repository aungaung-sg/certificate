Rails.application.routes.draw do
  get 'users/index'
  resources :courses
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :students do
    post :print_selected, :on => :collection
    get :course_data
  end
  root 'students#index'
  match '/users',   to: 'users#index',   via: 'get'
  resources :users
  resources :student_imports
end
