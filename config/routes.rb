Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'heros', to: 'heros#index'
  # post 'heros', to: 'heros#create'
  # get 'heros/new', to: 'heros#new', as: 'new_hero'
  # get 'heros/:id/edit', to: 'heros#edit', as: 'edit_hero'
  # get 'heros/:id', to: 'heros#show'
  # patch 'heros/:id', to: 'heros#update'
  # put 'heros/:id', to: 'heros#update'
  # delete 'heros/:id', to: 'heros#destroy', as: 'delete_hero'
  resources :heros do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :destroy, :show, :update, :edit] do
    resources :reviews, only: [:new, :create]
  end
end
