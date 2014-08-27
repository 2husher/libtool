require 'spec_helper'

describe "Books" do

	describe "Creating a book" do
	  before :each do
	      visit '/'
	      click_link 'Add book to library'
	  end

      it "should create a new book with valid parameters" do
          fill_in 'Identity',   with: "ISBN 0-1234-5678-9"
          fill_in 'Title',      with: "A Book Title"
          fill_in 'Author',     with: "An Author"
          fill_in 'Annotation', with: "An Annotation"
          select '1999',        from: 'book_publishing_year_1i'

          expect do
              click_button 'Add a new book'
          end.to change(Book, :count).by(1)

          expect(page).to have_content 'Book successfully created!'
        end

      it "should not create a new book with invalid parameters" do
          fill_in 'Identity',   with: ""
          fill_in 'Title',      with: ""
          fill_in 'Author',     with: ""
          fill_in 'Annotation', with: ""
          select '1999',        from: 'book_publishing_year_1i'

          expect do
              click_button 'Add a new book'
          end.to change(Book, :count).by(0)

          expect(page).to have_content "Can't save sorry:("

          expect(page).to have_content "4 errors prohibited this product from being saved:"
          expect(page).to have_content "Identity can't be blank"
          expect(page).to have_content "Title can't be blank"
          expect(page).to have_content "Author can't be blank"
          expect(page).to have_content "Annotation can't be blank"
      end
    end
end
