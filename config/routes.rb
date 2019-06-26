Rails.application.routes.draw do
  resources :address_books do
    member do
      get 'delete'
    end
    resources :contacts do
      member do
        get 'delete'
      end
    end
  end
  root 'address_books#index'
  devise_for :users
  namespace :admin do
    resources :users do
      member do
        get 'delete'
      end
      get '/change_role', to: 'users#change_role'
      delete '/destroy', to: 'users#destroy'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
