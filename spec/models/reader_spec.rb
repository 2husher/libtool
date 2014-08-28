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
	end

	describe "when date of birth is not present" do
		before { @reader.date_of_birth = "" }
		it { should_not be_valid }
	end

	describe "when date of registration is not present" do
		before { @reader.date_of_registration = "" }
		it { should_not be_valid }
	end

	describe "when home phone is not present" do
		before { @reader.home_phone = "" }
		it { should_not be_valid }
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
	end
end