Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get :my_garden, to: "pages#my_garden", as: :my_garden
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :plants, only: [ :index, :show ] do
    resources :user_plants, only: [:create]
  end

  resources :user_plants, only: [:edit, :update, :destroy, :show] do
    resources :personal_tasks, only: [ :show, :create, :update, :destroy ]
  end

  resources :categories, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  resources :gardens, only: [:show]

end
