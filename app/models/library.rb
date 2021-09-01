class Library < ApplicationRecord
  has_many :books, dependent: :destroy

  def count
    books.count
  end

  def order_books
    books.order(:title)
  end

  def self.order_created
    order(created_at: :desc)
  end
end
