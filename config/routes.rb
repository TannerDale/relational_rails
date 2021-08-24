Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/video_games', to: 'video_games#index'
  get '/video_games/new', to: 'video_games#new'
  get '/video_games/:id', to: 'video_games#show'
  get '/video_games/:id/edit', to: 'video_games#edit'
  patch '/video_games/:id', to: 'video_games#update'
  get '/video_games/:id/characters', to: 'video_games#game_characters'
  post '/video_games', to: 'video_games#create'

  get '/characters', to: 'characters#index'
  get '/characters/:id/edit', to: 'characters#edit'
  patch '/characters/:id', to: 'characters#update'
  get '/characters/:id', to: 'characters#show'
  get '/video_games/:id/characters/new', to: 'characters#new'
  post '/characters', to: 'characters#create'
end
