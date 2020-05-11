Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :gossips
  resources :users
  resources :cities
  resources :comments
  resources :sessions
  resources :likes



  root to: 'gossips#index'
  get '/team', to: 'page#team'
  get '/contact', to: 'page#contact'
  get '/welcome/:first_name', to: 'page#welcome', as: 'welcome'



end

