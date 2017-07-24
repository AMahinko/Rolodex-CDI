Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/:id' => 'contacts#index'
  resources :users do
    resources :contacts
  end

  # get '/contact/:id' => 'contacts#show'
  # get '/contacts/new' => 'contacts#create'
  # get '/contacts/edit/:id' => 'contacts#edit'
  #
  # get '/contacts/delete/:id/' => 'contacts#destroy'
  # post '/contacts/delete/:id/' => 'contacts#destroy'

end
