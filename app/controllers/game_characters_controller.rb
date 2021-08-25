class GameCharactersController < ApplicationController
  def index
    @game = VideoGame.find(params[:id])
    @game_characters = @game.ordered_characters(params)
  end
end
