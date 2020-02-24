# frozen_string_literal: true

Rails.application.routes.draw do
  resources :quotes
  # RESTful routes
  resources :examples, except: %i[new edit]

  get '/quotes' => 'quotes#index'
  # Show
  get '/quotes/:id' => 'quotes#show'
  #Delete
  delete '/quotes/:id' => 'quotes#destroy'
  resources :examples, except: %i[new edit]
  #Update
  patch '/quotes/:id' => 'quotes#update'

  #Create
  post '/quotes' => 'quotes#create'
  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

end
