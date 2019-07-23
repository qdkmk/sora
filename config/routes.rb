Rails.application.routes.draw do
  devise_for :users
  resources :books do
    collection do
      get 'search'
    end
  end
  root 'books#index'
end
