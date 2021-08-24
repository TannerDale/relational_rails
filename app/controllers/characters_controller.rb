class CharactersController < ApplicationController
  def index
    if params[:order]
      @characters = Character.only_humans.order(:name)
    else
      @characters = Character.only_humans
    end
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
end
