require 'rails_helper'

RSpec.describe Library, type: :model do
  describe 'relationships' do
    it { should have_many :books }
  end
  describe 'methods' do
    before(:each) do
      @lib1 = Library.create!(
        name: 'Mesa Public Library',
        employees: 15,
        open_weekends: true
      )
      @lib2 = Library.create!(
        name: 'Chandler Public Library',
        employees: 25,
        open_weekends: false
      )
      @book1 = Book.create!(
        library_id: @lib1.id,
        title: 'A Wizard of Earthsea',
        author_surname: 'Le Guin',
        nonfiction: false,
        year_published: 1968
      )
      @book2 = Book.create!(
        library_id: @lib1.id,
        title: 'Cosmos',
        author_surname: 'Sagan',
        nonfiction: true,
        year_published: 1980
      )
      @book3 = Book.create!(
        library_id: @lib1.id,
        title: 'Baseball',
        author_surname: 'Author',
        nonfiction: true,
        year_published: 1999
      )
    end

    it 'counts books' do
      expect(@lib1.count).to eq(3)
    end

    it 'organizes books in order by title' do
      expect(@lib1.order_books).to eq([@book1, @book3, @book2])
    end

    it 'organzies libraries by date created, descending' do
      expect(Library.order_created).to eq([@lib2, @lib1])
    end
  end
end
