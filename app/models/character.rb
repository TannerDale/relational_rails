class Character < ApplicationRecord
  belongs_to :video_game

  scope :over_age, ->(age) {
    where("age > ?", age)
  }

  scope :only_humans, -> {
    where(human: true)
  }

  scope :exact_search, ->(char_name) {
    where("name = ?", char_name)
  }

  scope :loose_search, ->(char_name) {
    where("name ILIKE ?", '%' + char_name + '%')
  }
end
