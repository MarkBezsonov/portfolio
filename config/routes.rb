Rails.application.routes.draw do
  root 'pages#home'
  resources :contacts, only: [:new, :create]
end
