Rails.application.routes.draw do
  get 'users/index'
  resources :courses
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :students do
    post :bulk_print, :on => :collection
    get :course_data
  end
  root 'students#index'
  match '/users',   to: 'users#index',   via: 'get'
  resources :users
  resources :student_imports
  resources :themes do
    put :update_theme
  end
end
