class LibrariesController < ApplicationController
  def index
    @libraries = Library.order_created
  end

  def new; end

  def show
    @library = Library.find(params[:id])
  end

  def library_books
    @library = Library.find(params[:id])
    @books = @library.books
    @books = @library.order_books if params[:order]

    @books = @books.over_year(params[:earliest_year_published]) if params[:earliest_year_published]
  end

  def create
    Library.create!(
      name: params[:name],
      employees: params[:employees],
      open_weekends: params[:open_weekends]
    )

    redirect_to '/libraries'
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(
      name: params[:name],
      employees: params[:employees],
      open_weekends: params[:open_weekends]
    )

    redirect_to "/libraries/#{params[:id]}"
  end

  def destroy
    library = Library.find(params[:id])
    library.destroy!

    redirect_to '/libraries'
  end
end
