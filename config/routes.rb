MealPlanner::Application.routes.draw do
  root to: 'home#index'

  resources :users, except: [:new, :edit, :destroy]
  resource :sessions, only: [:create]

  get '/signup' => 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy'
end
