Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  patch "capture", to: "pokemons#capture"
  resources :trainers
  patch "damage", to: "pokemons#damage"
  get "pokemons/new", to: "pokemons#new"
  post "pokemons", to: "pokemons#create"
end
