Rails.application.routes.draw do
  resources :address_books do
    resources :contacts do
      member do
        get 'delete'
      end
    end

    member do
      get 'delete'
    end
  end
  devise_for :users

  root to: 'address_books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
