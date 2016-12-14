Rails.application.routes.draw do
  root 'users#new'
  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/users/new'=>'users#new'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  post '/users' => 'users#create'
  delete '/users/:id' => 'users#destroy'
  delete '/sessions' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
