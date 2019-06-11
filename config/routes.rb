Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts
  devise_for :users
  namespace :admin do
    resources :users do
      get '/change_role', to: 'users#change_role'
      delete '/destroy', to: 'users#destroy'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
