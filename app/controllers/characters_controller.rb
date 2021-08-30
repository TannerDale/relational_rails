class CharactersController < ApplicationController
  def index
    @characters = search_helper
    @characters ||= Character.only_humans
  end

  def show
    @character = Character.find(params[:id])
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
