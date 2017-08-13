Terspective::Application.routes.draw do
  root :to => "home_page#index"
  resources :home_page
  resources :users
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :skip => [:registrations]
  devise_scope :users do
  end
end
