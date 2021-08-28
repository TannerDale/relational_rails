class VideoGamesController < ApplicationController
  def index
    if params[:sort]
      @games = VideoGame.ordered_character_count
    else
      @games = VideoGame.ordered_games
    end
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

  def destroy
    game = VideoGame.find(params[:id])
    game.destroy!

    redirect_to '/video_games'
  end
end
