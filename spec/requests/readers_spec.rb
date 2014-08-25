require 'spec_helper'

describe "Readers" do

    describe "Creating a reader" do

        it "should create a reader" do
            visit '/'
            click_link 'Register a new reader'

            fill_in 'Last name', with: 'Edisson'
            fill_in 'First name', with: 'Tomas'
            fill_in 'Middle name', with: 'Alva'
#            fill_in :date_of_birth, with: '1961-04-01'
            select('Option', from:'reader_date_of_birth_1i')

            fill_in 'Street', with: 'Backer str'
            fill_in 'Home number', with: '221'
            fill_in 'Building', with: '0'
            fill_in 'Flat_number', with: '13'
            fill_in 'Home phone', with: '123-45-67'

            fill_in 'Profession notes', with: 'Let it be'

            click_button 'Change reader\'s data'
            expect(page).to have_content("Reader successfully created!")
        end
    end

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

    describe "Viewing a reader" do

    end
end
