require 'spec_helper'

describe "Book pages" do

    subject { page }

    describe 'new' do
        before { visit new_book_path }

        it { should have_title("New Book | Library") }
        it { should have_content("Add a new book to the library") }

        describe "with invalid parameters" do
            
            it "should not create a new book" do
                expect { click_button 'Add a new book'}.not_to change(Book, :count)
            end

            describe "after clicking button" do

                before { click_button 'Add a new book'}
                
                it { should have_content("prohibited this product from being saved:") }
                it { should have_selector('div.error', text: "Can't save sorry:(") }
            end
        end

        describe "with valid parameters" do

            before do
               fill_in 'Identity',   with: "ISBN 0-1234-5678-9"
               fill_in 'Title',      with: "A Book Title"
               fill_in 'Author',     with: "An Author"
               fill_in 'Annotation', with: "An Annotation"
               select '1999',        from: 'book_publishing_year_1i'
            end

            it "should create a new book" do
                expect { click_button 'Add a new book' }.to change(Book, :count).by(1)
            end

            describe "after saving reader" do 
              before { click_button 'Add a new book' }
              let(:book){ Book.find_by(identity: "ISBN 0-1234-5678-9") }

              it { should have_content(book.identity) }
              it { should have_content(book.title) }
              it { should have_content(book.author) }
              it { should have_content(book.publishing_year.year) }
              it { should have_content(book.annotation) }
              it { should have_selector('div.notice', text: 'Book successfully created!') }
            end
        end
    end

    describe 'index' do
        before { visit books_path }

        it { should have_title("All Books | Library") }
        it { should have_content("All Books") }
    end

    describe 'show' do
        let(:book){ FactoryGirl.create(:book) }
        before { visit book_path(book) }

        it { should have_title("#{book.identity} | Library") }
        it { should have_content("A book") }
    end

    describe 'edit' do
        let(:book){ FactoryGirl.create(:book) }
        before { visit edit_book_path(book) }

        describe "page" do
          it { should have_title("Edit Book | Library") }
          it { should have_content("Change the book data") }
        end

        describe "with valid information" do
            
            let(:new_identity){ "ISBN 5-5555-7777-7" }
            let(:new_title){ "Harry Potter" }
            let(:new_author){ "Rowling" }
            let(:new_annotation){ "Trash" }
            let(:new_publishing_year){ 2004 }

            before do
               fill_in 'Identity',          with: new_identity
               fill_in 'Title',             with: new_title
               fill_in 'Author',            with: new_author
               fill_in 'Annotation',        with: new_annotation
               select  new_publishing_year, from: 'book_publishing_year_1i'

               click_button "Change data"
            end

            it { should have_selector('div.notice', 'Book successfully updated!') }
            specify{ expect(book.reload.identity).to eq new_identity }
            specify{ expect(book.reload.title).to eq new_title }
            specify{ expect(book.reload.author).to eq new_author }
            specify{ expect(book.reload.annotation).to eq new_annotation }
            specify{ expect(book.reload.publishing_year.year).to eq new_publishing_year }
        end

        describe "with invalid information" do
            before do
                fill_in "Identity", with: ""
                click_button "Change data"
            end

            it { should have_selector('div.error', "Can't save sorry:(") }
            it { should have_content("Change the book data") }
        end
    end
end
