# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shelves, only: %i[create destroy]

  get 'users/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :users, only: %i[index show]
  resources :books do
    collection do
      get 'search'
      get 'author'
    end
  end
  root 'books#search'
end
