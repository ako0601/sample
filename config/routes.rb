Rails.application.routes.draw do

  get "signup" => 'users#new'
  get "login" => 'sessions#new'
  get "logout" => 'sessions#destroy'
  
  get '/auth/:provider/callback', to: 'authentications#create'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  resources :users
  resources :sessions
  resources :password_resets
  resources :shops do
    resources :requests
  end 
  
  root to: 'home#index'
  get "about" => 'home#about'
end
