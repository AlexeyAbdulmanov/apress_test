Rails.application.routes.draw do
  root 'pages#index'

  resources :pages, param: :slug

  get 'add', to: 'pages#add_root'
end
