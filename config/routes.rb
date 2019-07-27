# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shelves, only: %i[create destroy]
  resources :revues, only: [:create, :destroy, :edit]
  delete 'shelves/book_tid'

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
