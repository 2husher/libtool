class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :edit, :destroy]

  def index
    @books = Book.order(:identity)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    #@book.reader_id = '1'
    if @book.save
        redirect_to @book
    else
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
        redirect_to @book
    else
        render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:identity, :title, :author, :annotation, :publishing_year, :returning_date)
    end
end
