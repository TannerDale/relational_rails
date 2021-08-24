class VideoGame < ApplicationRecord
  has_many :characters

  def character_count
    characters.count
  end
end
