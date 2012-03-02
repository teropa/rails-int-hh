Library::Application.routes.draw do
  
  resources :books do
    collection do
      get :search
    end
    resources :reservations, only: [:create, :new] do
      member do
        put :free
      end
    end
  end
  
  root :to => 'books#index'

end
