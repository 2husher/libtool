# == Schema Information
#
# Table name: books
#
#  id              :integer          not null, primary key
#  reader_id       :integer
#  identity        :string(255)
#  title           :string(255)
#  author          :string(255)
#  annotation      :text
#  returning_date  :date
#  created_at      :datetime
#  updated_at      :datetime
#  publishing_year :date
#
# Indexes
#
#  index_books_on_identity  (identity) UNIQUE
#

require 'spec_helper'

describe "Book" do

	subject{ @book }

	before do
		@book = Book.new(identity:        "ISBN 0-1234-5678-9", 
        				 title:           "War and Peace",
        				 author:          "Lev Tolstoy",
        				 publishing_year: "1998-01-01",
        				 annotation:      "A big book")
	end

	it { should respond_to(:identity) }
	it { should respond_to(:title) }
	it { should respond_to(:author) }
	it { should respond_to(:publishing_year) }
	it { should respond_to(:annotation) }

	it { should be_valid }

	describe "when identity" do

		describe "is not present" do
			before{ @book.identity = "" }
			it { should_not be_valid}
		end

		describe "is not unique" do
			before do
				book_with_same_identity = @book.dup
				book_with_same_identity.save
			end
			it { should_not be_valid }
		end
	end

	describe "when title" do

		describe "is not present" do
			before{ @book.title = "" }
			it { should_not be_valid}
		end
	end

	describe "when author" do

		describe "is not present" do
			before{ @book.author = "" }
			it { should_not be_valid}
		end
	end

	describe "when publishing_year" do

		describe "is not present" do
			before{ @book.publishing_year = "" }
			it { should_not be_valid}
		end

		describe "format is invalid" do
			it "should not be valid" do 
				#dates_of_birth = %w[1929-01-01 2005-12-31 1990-00-00 1990-13-01 1990-01-32]
				publishing_years = %w[1990-00-00 1990-13-01 1990-01-32]
				publishing_years.each { |publishing_year|
					@book.publishing_year = publishing_year
					should_not be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do 
				publishing_years = %w[1930-01-01 1990-06-22 2004-12-31]
				publishing_years.each { |publishing_year|
					@book.publishing_year = publishing_year
					should be_valid
				}
			end
		end	
	end

	describe "when annotation" do

		describe "is not present" do
			before{ @book.annotation = "" }
			it { should_not be_valid}
		end
	end
end
