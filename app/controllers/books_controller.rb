class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :edit, :destroy]

  def index
    @books = Book.paginate(page: params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    #@book.reader_id = '1'
    if @book.save
        redirect_to @book, notice: "Book successfully created!"
    else
        flash.now[:error] = "Can't save sorry:("
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
        redirect_to @book, notice: "Book successfully updated!"
    else
        flash.now[:error] = "Can't save sorry:("
        render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book successfully destroyed!"
  end

  def return
    book = Book.find(params[:id])
    reader_id = book.reader_id
    book.update(reader_id: nil)
    redirect_to reader_path(reader_id), notice: "Book #{book.identity} #{book.title} #{book.author} returned to the library!"
  end

  def continue
    book = Book.find(params[:id])
    reader_id = book.reader_id
    book.update(returning_date: Date.today + 7.days)
    redirect_to reader_path(reader_id), notice: "Book #{book.identity} #{book.title} #{book.author} continued to #{book.returning_date}"
  end

  private
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:identity, :title, :author, :annotation, :publishing_year, :returning_date)
    end
end
