Clgn2::Application.routes.draw do
  scope '(:locale)', :locale => /en|tr/  do
    root :to => "sn_urls#new"
    resource :home_page
    resources :sn_urls
    get 'sn_url_search' => 'sn_urls#search', :as => 'sn_url_search'
    post 'sn_url_go' => 'sn_urls#go', :as => 'sn_url_go'

    resources :users
    devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }, :skip => [:registrations]
    devise_scope :users do

    end
  end
end
