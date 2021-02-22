Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'heroes', to: 'heroes#index'
  post 'heroes', to: 'heroes#create'
  get 'heroes/new', to: 'heroes#new'
  get 'heroes/:id/edit', to: 'heroes#edit', as: 'edit_hero'
  get 'heroes/:id', to: 'heroes#show', as: 'hero'
  patch 'heroes/:id', to: 'heroes#update'
  put 'heroes/:id', to: 'heroes#update'
  delete 'heroes/:id', to: 'heroes#destroy'
end
