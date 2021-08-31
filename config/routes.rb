Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/video_games', to: 'video_games#index'
  get '/video_games/new', to: 'video_games#new'
  get '/video_games/:id', to: 'video_games#show'
  get '/video_games/:id/edit', to: 'video_games#edit'
  patch '/video_games/:id', to: 'video_games#update'
  get '/video_games/:id/characters', to: 'game_characters#index'
  post '/video_games', to: 'video_games#create'
  delete '/video_games/:id', to: 'video_games#destroy'

  get '/characters', to: 'characters#index'
  get '/characters/:id/edit', to: 'characters#edit'
  patch '/characters/:id', to: 'characters#update'
  get '/characters/:id', to: 'characters#show'
  get '/video_games/:id/characters/new', to: 'characters#new'
  post '/characters', to: 'characters#create'

  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post 'libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/books', to: 'libraries#library_books'
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'

  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  get '/books/:id', to: 'books#show'
end
