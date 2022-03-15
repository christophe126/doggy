Rails.application.routes.draw do
  devise_for :users

  root to: 'user_searches#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_pets, only: %i[index]
  resources :pensions, only: %i[index show search new create] do
    resources :bookings, only: %i[new create edit update pay]
  end
  resources :pages, only: %i[index]
  resources :bookings, only: %i[index]
  resources :user_searches, only: %i[index show new create edit update]
  resources :bookings, only: %i[show]
end
