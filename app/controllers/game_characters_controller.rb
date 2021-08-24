class GameCharactersController < ApplicationController
  helper_method :characters

  def index
    @game = VideoGame.find(params[:id])
  end

  private

  def characters
    if params[:order]
      @game.ordered_characters
    else
      @game.characters
    end
  end
end
