class GameCharactersController < ApplicationController
  def index
    @game = VideoGame.find(params[:id])
    @game_characters = @game.ordered_characters(params)
    if params[:minimum_age]
      @game_characters = @game_characters.over_age(params[:minimum_age])
    end
  end
end
