require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it { should belong_to :library }
  end

  describe 'filtering' do
    before(:each) do
      @lib1 = Library.create!(
        name: 'Mesa Public Library',
        employees: 15,
        open_weekends: true
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
    it 'can filter by minimum published year' do
      expect(Book.all.over_year(1982)).to eq([@book3])
    end
  end
end
