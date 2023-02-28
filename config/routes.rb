Rails.application.routes.draw do
  devise_for :users
  root to: "plants#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plants, only: %i[index show new create destroy edit update] do
    resources :bookings, only: %i[new create index show edit update]
  end
  resources :bookings, only: [:destroy]
end
