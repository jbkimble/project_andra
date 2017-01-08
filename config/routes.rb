Rails.application.routes.draw do
  resources :images
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home#show'
  get '/signup' => 'users#new'
  resources :users, only: [:show, :edit, :create, :update, :destroy]
  # post '/users' => 'users#create'
  # get '/users/:id/edit' => 'users#edit'

  get '/takephoto' => 'photos#new', as: 'take_photo'
  get '/logout' => 'sessions#destroy'
  get '/emotion' => 'emotions#show', as:'emotion'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :experiments do
    resources :runs
  end
  # get '/experiment' => 'experiments#index'
  get '/data' => 'data#index'
  # resources :users, only: [:create, :new]
end
