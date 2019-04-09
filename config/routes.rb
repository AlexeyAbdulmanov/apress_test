Rails.application.routes.draw do
  root 'pages#index'

  resources :pages, param: :slug
  # resources :pages, path: '', param: :slug

  get 'add', to: 'pages#new'
  get '/*path/add', to: 'pages#new'
end
