require 'spec_helper'

describe "Reader" do 

	subject{ reader }
	
	let(:reader){ FactoryGirl.create(:reader) }

	describe "Reader's attributes" do
	
		it { should respond_to(:first_name) }
	
		it { should respond_to(:middle_name) }

		it { should respond_to(:last_name) }

		
	end
end