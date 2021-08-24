class VideoGamesController < ApplicationController
  def index
    @games = VideoGame.all.order(:created_at)
  end

  def new
  end

  def create
    VideoGame.create!(
      name: params[:name],
      campaign_hours: params[:campaign_hours],
      multiplayer: params[:multiplayer]
    )

    redirect_to '/video_games'
  end

  def show
    @game = VideoGame.find(params[:id])
  end

  def edit
    @game = VideoGame.find(params[:id])
  end

  def update
    game = VideoGame.find(params[:id])

    game.update(
      name: params[:name],
      campaign_hours: params[:campaign_hours],
      multiplayer: params[:multiplayer]
    )

    redirect_to "/video_games/#{params[:id]}"
  end

  def game_characters
    @game = VideoGame.find(params[:id])
  end
end
