Rails.application.routes.draw do
  root :to => 'home#show'

  get 'signup', to: 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:show, :edit, :create, :update, :destroy]

  resources :images

  resources :experiments, only: [:new, :create, :index, :show] do
    resources :runs, only: [:new]
  end




  # post '/users' => 'users#create'
  # get '/users/:id/edit' => 'users#edit'
  # get '/takephoto' => 'photos#new', as: 'take_photo'
  # get '/emotion' => 'emotions#show', as:'emotion'
  # get '/experiment' => 'experiments#index'
  # get '/data' => 'data#index'
  # resources :users, only: [:create, :new]
end
