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
    Character.create(
      name: params[:name],
      age: params[:age],
      human: params[:human],
      video_game_id: params[:video_game_id]
    )

    redirect_to "/video_games/#{params[:video_game_id]}/characters"
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    character = Character.find(params[:id])
    character.update(
      name: params[:name],
      age: params[:age],
      human: params[:human],
      video_game_id: character.video_game_id
    )

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
end
