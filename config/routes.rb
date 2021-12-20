Rails.application.routes.draw do
    devise_for :users 
    resources :posts
    resources :users
    # , only: [:index]
        # do
      # resources :posts, only: [:new, :create]
        # end
      # resources :posts, only: [:index, :show, :edit, :update, :destrop]

  root to: "pages#index"
  get "dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

