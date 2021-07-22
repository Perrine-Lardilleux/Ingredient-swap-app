Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'recipes#index', as: :authenticated_root

      resources :recipes, only: [:show], as: :recipe do
        resources :recipe_ingredients
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  # get 'recipes/:id', to: 'recipes#show', as: :recipe
end
