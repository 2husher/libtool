class SearchController < ApplicationController
  def find
    @found_book = Book.find_by_identity(params[:query])
    @reader = Reader.find(params[:return_to])
    @found_book.update_attribute(:reader_id, @reader.id)
    redirect_to @reader
  end
end
