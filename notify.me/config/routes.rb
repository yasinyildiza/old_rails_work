NotifyMe::Application.routes.draw do
  root :to => "home_page#index"
  resources :home_page
  resources :notifications
end
