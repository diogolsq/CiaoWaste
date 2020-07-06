Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :meals do
    resources :reviews, only: [ :new, :create ]
  end


  resources :restaurants
  resources :users, only: [ :show ]

  resources :order_to_meals, only: [:create, :update, :destroy]
  resources :orders, only: [ :show, :update ]

end
