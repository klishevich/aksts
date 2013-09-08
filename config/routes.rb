Aksts::Application.routes.draw do

  resources :users

  match '/signup',  to: 'users#new'

  root to: 'static_pages#home'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/help', to: 'static_pages#help'

end
