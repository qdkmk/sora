Rails.application.routes.draw do
  resources:shelves,only:[:create,:destroy]

  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, :only=>[:index,:show]
  resources :books do
    collection do
      get 'search'
      get 'author'
    end
  end
  root 'books#index'
end
