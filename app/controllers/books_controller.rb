class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new; end

  def show
    @book = Book.find(params[:id])
  end

  def create
    Book.create!(
      title: params[:title],
      author_surname: params[:author_surname],
      nonfiction: params[:nonfiction],
      year_published: params[:year_published],
      library_id: params[:library_id]
    )

    redirect_to "/libraries/#{params[:library_id]}/books"
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(
      title: params[:title],
      author_surname: params[:author_surname],
      nonfiction: params[:nonfiction],
      year_published: params[:year_published],
      library_id: params[:library_id]
    )

    redirect_to "/books/#{book.id}"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy!

    redirect_to '/books'
  end
end
