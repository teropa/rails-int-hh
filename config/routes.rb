Library::Application.routes.draw do
  
  resources :books
  
  root :to => 'site#index'

end
