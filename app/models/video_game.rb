class VideoGame < ApplicationRecord
  has_many :characters, dependent: :destroy

  def character_count
    characters.length
  end

  def ordered_characters(params)
    if params[:order]
      characters.order(:name)
    else
      characters
    end
  end
end
