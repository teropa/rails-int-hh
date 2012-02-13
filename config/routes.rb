Library::Application.routes.draw do
  
  resources :books do
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end
  end
  
  root :to => 'site#index'

end
