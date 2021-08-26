class Library < ApplicationRecord
  has_many :books

  def count
    books.count
  end
end
