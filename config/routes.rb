Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_pets, only: %i[index update new create]
  resources :pensions, only: %i[index show] do
    resources :bookings, only: %i[new]
  end
  resources :bookings, only: %i[index]
end
