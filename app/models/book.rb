class Book < ApplicationRecord
  belongs_to :library

  scope :over_year, lambda { |year_published| where('year_published > ?', year_published) }
end
