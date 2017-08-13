Documenter::Application.routes.draw do
  resources :method_parameters


  resources :return_values


  resources :method_members


  resources :data_members


  resources :model_classes


  resources :method_types


  resources :data_types


  resources :class_types


  resources :projects

  root :to => "projects#index"
end
