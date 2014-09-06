# == Schema Information
#
# Table name: readers
#
#  id                   :integer          not null, primary key
#  is_banned            :boolean
#  created_at           :datetime
#  updated_at           :datetime
#  date_of_birth        :date
#  first_name           :string(255)
#  middle_name          :string(255)
#  last_name            :string(255)
#  date_of_registration :date
#  home_phone           :string(255)
#  profession_notes     :text
#  street               :string(255)
#  home_number          :integer
#  building             :integer
#  flat_number          :integer
#  reader_card_id       :string(255)
#
# Indexes
#
#  index_readers_on_reader_card_id  (reader_card_id) UNIQUE
#

require 'spec_helper'

describe "Reader" do 

	subject{ @reader }
	
	before do
		@reader = Reader.new(first_name:           "Jean",
        					 middle_name:          "Cloddte",
        					 last_name:            "VanDamme",
        					 reader_card_id:       "1234",
        					 date_of_birth:        "1980-05-01",
        					 date_of_registration: "2014-08-23",
        					 home_phone:           "123-45-67",
        					 profession_notes:     "Worker",
        					 street:               "Elm str",
        					 home_number:          "13",
        					 building:             "4",
        					 flat_number:          "35")
	end


	it { should respond_to(:first_name) }
	it { should respond_to(:middle_name) }
	it { should respond_to(:last_name) }
	it { should respond_to(:reader_card_id) }
    it { should respond_to(:date_of_birth) }    
    it { should respond_to(:date_of_registration) }
    it { should respond_to(:home_phone) }
    it { should respond_to(:profession_notes) }
    it { should respond_to(:street) }  
    it { should respond_to(:home_number) }
    it { should respond_to(:building) }       
    it { should respond_to(:flat_number) }          

    it { should be_valid }

    describe "when first name" do

		describe "is not present" do
			before { @reader.first_name = "" }
			it { should_not be_valid }
		end

		describe "when first name is too long" do
			before { @reader.first_name = "a"*31 }
			it { should_not be_valid }
		end
	end

	describe "when middle name" do

		describe "is not present" do
			before { @reader.middle_name = "" }
			it { should_not be_valid }
		end
	
		describe "is too long" do
			before { @reader.middle_name = "a"*31 }
			it { should_not be_valid }
		end
	end

	describe "when last name" do

		describe "is not present" do
			before { @reader.last_name = "" }
			it { should_not be_valid }
		end
	
		describe "is too long" do
			before { @reader.last_name = "a"*31 }
			it { should_not be_valid }
		end
	end

	describe "when reader card id" do

		describe "is not present" do
			before { @reader.reader_card_id = "" }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				card_ids = %w[abcd *bcd ab+d 12/8 1\23 12.4 1,34]
				card_ids.each { |card_id|
					@reader.reader_card_id = card_id
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do 
				card_ids = %w[0000 0001 0010 0100 1000 1234]
				card_ids.each { |card_id|
					@reader.reader_card_id = card_id
					should be_valid
				}
			end
		end	

		describe "is already taken" do
			before do
				reader_with_same_reader_card_id = @reader.dup
				reader_with_same_reader_card_id.save
			end

			it { should_not be_valid }
		end	
	end

	describe "when date of birth" do

		describe "is not present" do
			before { @reader.date_of_birth = "" }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				#dates_of_birth = %w[1929-01-01 2005-12-31 1990-00-00 1990-13-01 1990-01-32]
				dates_of_birth = %w[1990-00-00 1990-13-01 1990-01-32]
				dates_of_birth.each { |date_of_birth|
					@reader.date_of_birth = date_of_birth
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do 
				dates_of_birth = %w[1930-01-01 1990-06-22 2004-12-31]
				dates_of_birth.each { |date_of_birth|
					@reader.date_of_birth = date_of_birth
					should be_valid
				}
			end
		end	
	end

	describe "when date of registration" do

		describe "is not present" do
			before { @reader.date_of_registration = "" }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				#dates_of_birth = %w[1929-01-01 2005-12-31 1990-00-00 1990-13-01 1990-01-32]
				dates_of_registration = %w[1990-00-00 1990-13-01 1990-01-32]
				dates_of_registration.each { |date_of_registration|
					@reader.date_of_registration = date_of_registration
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do 
				dates_of_registration = %w[1930-01-01 1990-06-22 2004-12-31]
				dates_of_registration.each { |date_of_registration|
					@reader.date_of_registration = date_of_registration
					should be_valid
				}
			end
		end	
	end

	describe "when home phone" do

		describe "is not present" do
			before { @reader.home_phone = "" }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				home_phones = %w[1234567 1-23-45-67 123-4567]
				home_phones.each { |home_phone|
					@reader.home_phone = home_phone
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do 
				home_phones = %w[123-45-67 000-00-00 999-99-99]
				home_phones.each { |home_phone|
					@reader.home_phone = home_phone
					should be_valid
				}
			end
		end	
	end

	describe "when profession notes" do
	
		describe "is not present" do
			before { @reader.profession_notes = "" }
			it { should_not be_valid }
		end
	end

	describe "when  street" do
		
		describe "is not present" do
			before { @reader.street = "" }
			it { should_not be_valid }
		end
	end

	describe "when home number" do
		
		describe "is not present" do
			before { @reader.home_number = "" }
			it { should_not be_valid }
		end

		describe "is too long" do 
			before { @reader.home_number = "1"*5 }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				home_numbers = %w[12345 123456]
				home_numbers.each { |home_number|
					@reader.home_number = home_number
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do
				# home number = 0 тоже подходит 
				home_numbers = %w[1 22 333 4444]
				home_numbers.each { |home_number|
					@reader.home_number = home_number
					should be_valid
				}
			end
		end	
	end

	describe "when building" do
	
		describe "is not present" do
			before { @reader.building = "" }
			it { should_not be_valid }
		end

		describe "is too long" do
			before { @reader.building = "1"*4 }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				buildings = %w[1234 12345]
				buildings.each { |building|
					@reader.building = building
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do 
				buildings = %w[0 1 22 333]
				buildings.each { |building|
					@reader.building = building
					should be_valid
				}
			end
		end	
	end

	describe "when flat number" do 
		describe "is not present" do
			before { @reader.flat_number = "" }
			it { should_not be_valid }
		end

		describe "is too long" do
			before { @reader.flat_number = "1"*5 }
			it { should_not be_valid }
		end

		describe "format is invalid" do
			it "should not be valid" do 
				flat_numbers = %w[12345 123456]
				flat_numbers.each { |flat_number|
					@reader.flat_number = flat_number
					expect(@reader).not_to be_valid
				}
			end
		end

		describe "format is valid" do
			it "should be valid" do
				# flat number = 0 тоже подходит 
				flat_numbers = %w[1 22 333 4444]
				flat_numbers.each { |flat_number|
					@reader.flat_number = flat_number
					should be_valid
				}
			end
		end	
	end
end
