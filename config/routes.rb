Rails.application.routes.draw do
  root 'pages#index'

  resources :pages, path: '', path_names: { new: 'add' }, param: :slug
end
