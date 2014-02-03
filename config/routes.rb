DateApplication::Application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/signup', to: 'users#new', via: 'get'
  get 'static_pages/help', to: 'static_pages#help', as: :help
  get 'static_pages/about', to: 'static_pages#about', as: :about
  get 'static_pages/contact', to: 'static_pages#contact', as: :contact


end
