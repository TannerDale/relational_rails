class Library < ApplicationRecord
  has_many :books, dependent: :destroy

  def count
    books.count
  end
end
