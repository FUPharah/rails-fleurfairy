Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plants, only: %i[index show new create destroy] do
    resources :bookings, only: %i[new create index show]
  end
  resources :bookings, only: [:destroy]
end
