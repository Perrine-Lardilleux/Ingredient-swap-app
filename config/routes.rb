Rails.application.routes.draw do
  devise_for :users
  root to: 'recipes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:show], as: :recipe do
    resources :recipe_ingredients
  end
  # get 'recipes/:id', to: 'recipes#show', as: :recipe
end
