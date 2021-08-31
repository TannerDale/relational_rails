class VideoGamesController < ApplicationController
  def index
    if params[:sort]
      @games = VideoGame.ordered_character_count
    else
      @games = VideoGame.ordered_games
    end
  end

  def new
    @game = VideoGame.new
  end

  def create
    VideoGame.create!(video_game_params)

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
    game.update(video_game_params)

    redirect_to "/video_games/#{game.id}"
  end

  def destroy
    game = VideoGame.find(params[:id])
    game.destroy!

    redirect_to '/video_games'
  end

  private

  def video_game_params
    params.require(:video_game).permit(:name, :campaign_hours, :multiplayer)
  end
end
