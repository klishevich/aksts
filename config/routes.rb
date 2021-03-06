Aksts::Application.routes.draw do

  resources :widgets, only: [:index]

  resources :messages

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :applics

  resources :password_resets

  
  get 'view_applic', to: 'applics#show'
  match '/edit_applic', to: 'applics#edit'
  match '/apply', to: 'applics#new'
  match '/signup',  to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'

  root to: 'static_pages#home'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/help', to: 'static_pages#help'

end
