Rails.application.routes.draw do
  root 'pages#home'
  get 'about_me', to: 'pages#about_me'
  get 'my_credentials', to: 'pages#my_credentials'
  get 'my_work', to: 'pages#my_work'
  get 'contact_me', to: 'pages#contact_me'
end
