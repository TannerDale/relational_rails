class CharactersController < ApplicationController
  def index
    @characters = search_helper
    @characters ||= Character.only_humans
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
  end

  def create
    Character.create(character_params)

    redirect_to "/video_games/#{params[:video_game_id]}/characters"
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    character = Character.find(params[:id])
    character.update(character_params)

    redirect_to "/characters/#{character.id}"
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy!

    redirect_to '/characters'
  end

  private

  def search_helper
    if params[:exact_name]
      Character.exact_search(params[:exact_name])
    elsif params[:loose_name]
      Character.loose_search(params[:loose_name])
    end
  end

  def character_params
    params.permit(:name, :age, :human, :video_game_id)
  end
end
