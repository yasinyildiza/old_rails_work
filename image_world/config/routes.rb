ImageWorld::Application.routes.draw do
  root :to => "home_page#index"
  resources :home_page
  resources :categories
  resources :works
  resources :projects
  resources :images
  resources :users
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :skip => [:registrations]
  devise_scope :users do
  end
end
