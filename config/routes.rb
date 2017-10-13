Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  post "capture", to: "pokemons#capture"
  resources :trainers
end
