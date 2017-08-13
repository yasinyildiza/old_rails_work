Clgn::Application.routes.draw do
  scope '(:locale)', :locale => /en|tr/  do
    root :to => "home_page#index"
    resource :home_page

    resources :users
    devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :skip => [:registrations]
    devise_scope :users do

    end

    resources :people
    resources :companies
    resources :houses

    resources :cities do
     get 'getTowns', on: :collection, action: :getTowns, as: 'getTowns'
    end

    get 'house_search' => 'houses#index', :as => 'house_search'
  end
end
