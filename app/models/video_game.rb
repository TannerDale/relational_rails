class VideoGame < ApplicationRecord
  has_many :characters

  def character_count
    characters.count
  end

  def ordered_characters
    characters.order(:name)
  end
end
