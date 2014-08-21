require 'rails_helper'

describe "Readers" do

    describe "All readers" do

        it "should have the content 'All Readers" do
            visit '/readers'
            expect(page).to have_content('All Readers')
        end

        it "should have the title 'Library'" do
            visit '/readers'
            expect(page).to have_title('Library')
        end
    end
end
