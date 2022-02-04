Rails.application.routes.draw do
  root 'pages#home'
  resources :contacts, only: [:home, :form]
end
