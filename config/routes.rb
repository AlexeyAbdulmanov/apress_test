Rails.application.routes.draw do
  root 'pages#index'
  resources :pages, param: :slug
end
