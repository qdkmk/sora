Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :users, :only=>[:index,:show]
  resources :books do
    collection do
      get 'search'
    end
  end
  root 'books#index'
end
