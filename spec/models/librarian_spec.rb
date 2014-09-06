# == Schema Information
#
# Table name: librarians
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  birth_date      :date
#  password_digest :string(255)
#

require 'spec_helper'

describe "Librarian" do 

    subject{ @librarian }

    before do
        @librarian = Librarian.new(name: "Great Librarian",
                                   birth_date: "1965-09-01",
                                   password: "foobar",
                                   password_confirmation: "foobar")
    end

    it { should respond_to(:name)}
    it { should respond_to(:birth_date) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authenticate) }

    it { should be_valid }

    describe "with name" do

        describe "is not present" do
            before { @librarian.name = "" }
            it { should_not be_valid }
        end
    end

    describe "with birth_date" do

        describe "is not present" do
            before { @librarian.birth_date = "" }
            it { should_not be_valid }
        end

        describe "format is invalid" do
            it "should not be valid" do 
                birth_dates = %w[1990-00-00 1990-13-01 1990-01-32]
                birth_dates.each { |birth_date|
                    @librarian.birth_date = birth_date
                    should_not be_valid
                }
            end
        end

        describe "format is valid" do
            it "should be valid" do 
                birth_dates = %w[1930-01-01 1990-06-22 2004-12-31]
                birth_dates.each { |birth_date|
                    @librarian.birth_date = birth_date
                    should be_valid
                }
            end
        end    
    end

    describe "with password" do

        describe "is not present" do
            before do
                @librarian.password = "" 
                @librarian.password_confirmation = ""
            end
            it { should_not be_valid }
        end

        describe "with password confirmation mismatches" do
            before { @librarian.password_confirmation = "mismatch" }
            it { should_not be_valid }
        end

        describe "with authentication method" do
            before { @librarian.save }
            let(:found_librarian){ Librarian.find_by(name: @librarian.name) }

            describe "with valid password" do
                let(:valid_password_librarian){ found_librarian.authenticate("foobar") }
                it { should == valid_password_librarian }
            end

            describe "with invalid password" do
                let(:invalid_password_librarian){ found_librarian.authenticate("invalid") }             
                it { should_not == invalid_password_librarian }
                it { expect(invalid_password_librarian).to be_false }
            end
        end
    end
end
