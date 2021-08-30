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
  patch '/video_games/:id/characters', to: 'game_characters#update'

  get '/characters', to: 'characters#index'
  get '/characters/:id/edit', to: 'characters#edit'
  patch '/characters/:id', to: 'characters#update'
  get '/characters/:id', to: 'characters#show'
  delete '/characters/:id', to: 'characters#destroy'

  get '/video_games/:id/characters/new', to: 'characters#new'

  post '/characters', to: 'characters#create'

  get '/libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/books', to: 'libraries#library_books'

  get '/books', to: 'books#index'
  get '/books/new', to: 'books#new'
  get '/books/:id', to: 'books#show'
end
