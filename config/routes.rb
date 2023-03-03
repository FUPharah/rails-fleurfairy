Rails.application.routes.draw do
  devise_for :users
  root to: "plants#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :plants, only: %i[index show new create destroy edit update] do
    resources :bookings, only: %i[new create edit update]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[show destroy index]
  get "dashboard", to: "pages#dashboard"
  get "myplants", to: "pages#myplants"
  # get "plants/:id/reviews", to: "reviews#new", as: :new_plant_review
  # post "plants/:id/reviews", to: "reviews#create"
end
