# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  authenticated :user do
    root to: 'items#index'
  end

  root to: redirect('/users/sign_in')

  resources :items
end
