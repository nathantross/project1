DateApplication::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root  'static_pages#home'



  get '/signup', to: 'users#new', via: 'get'
  get '/signin', to: 'sessions#new', via: 'get'
  get '/signout', to: 'sessions#destroy', via: 'delete'


  get 'static_pages/help', to: 'static_pages#help', as: :help
  get 'static_pages/about', to: 'static_pages#about', as: :about
  get 'static_pages/contact', to: 'static_pages#contact', as: :contact


end
