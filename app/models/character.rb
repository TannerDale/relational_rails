class Character < ApplicationRecord
  belongs_to :video_game

  def self.only_humans
    Character.where(human: true)
  end
end
