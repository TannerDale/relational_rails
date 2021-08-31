class VideoGame < ApplicationRecord
  has_many :characters, dependent: :destroy

  def character_count
    characters.length
  end

  scope :ordered_character_count, -> {
    sort_by(&:character_count).reverse
  }

  def ordered_characters(params)
    if params[:order]
      characters.order(:name)
    else
      characters
    end
  end

  scope :ordered_games, -> {
    order(:created_at)
  }
end
