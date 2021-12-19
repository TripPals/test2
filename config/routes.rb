Rails.application.routes.draw do
    devise_for :users 

    resources :users do
      resources :posts, only: [:index, :new, :create]
    end
      resources :posts, only: [:show, :edit, :update, :destrop]

  root to: "pages#index"
  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

