# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chat_rooms, only: %i[index show create] do
    resources :conversations, only: %i[create]
  end
  devise_for :users

  root to: 'chat_rooms#index'
end
