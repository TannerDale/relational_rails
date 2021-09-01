Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/video_games', to: 'video_games#index'
  get '/video_games/new', to: 'video_games#new'
  get '/video_games/:id', to: 'video_games#show'
  get '/video_games/:id/edit', to: 'video_games#edit'
  patch '/video_games/:id', to: 'video_games#update', as: 'video_game'
  post '/video_games', to: 'video_games#create'
  delete '/video_games/:id', to: 'video_games#destroy'

  get '/video_games/:id/characters', to: 'game_characters#index'
  get '/video_games/:id/characters/new', to: 'game_characters#new'
  post '/video_games/:video_game_id/characters', to: 'game_characters#create'
  patch '/video_games/:video_game_id/characters/:id', to: 'game_characters#update'
  get '/video_games/:video_game_id/characters/:id/edit', to: 'game_characters#edit'

  get '/characters', to: 'characters#index'
  get '/characters/:id', to: 'characters#show'
  delete '/characters/:id', to: 'characters#destroy'

  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  post 'libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/books', to: 'libraries#library_books'
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#destroy'

  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  get '/books/:id', to: 'books#show'
  get '/libraries/:id/books/new', to: 'books#new'
  post '/books', to: 'books#create'
  get '/books/:id/edit', to: 'books#edit'
  patch '/books/:id', to: 'books#update'
  delete 'books/:id', to: 'books#destroy'
end
