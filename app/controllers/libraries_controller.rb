class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end

  def new
  end

  def show
    @library = Library.find(params[:id])
  end

  def library_books
    @library = Library.find(params[:id])
  end
end
