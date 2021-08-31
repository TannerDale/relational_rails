class GameCharactersController < ApplicationController
  def index
    @game = VideoGame.find(params[:id])
    @game_characters = @game.ordered_characters(params)
    if params[:minimum_age]
      @game_characters = @game_characters.over_age(params[:minimum_age])
    end
  end

  def new
    @game = VideoGame.find(params[:id])
  end

  def create
    char = Character.create!(character_params)
    redirect_to "/video_games/#{params[:video_game_id]}/characters"
  end

  def edit
    @game = VideoGame.find(params[:video_game_id])
    @character = Character.find(params[:id])
  end

  def update
    character = Character.find(params[:id])
    character.update(character_params)

    redirect_to "/characters/#{character.id}"
  end

  private

  def character_params
    params.permit(:video_game_id, :name, :age, :human)
  end
end
