require 'spec_helper'

describe "Readers" do

    describe "Creating a reader" do
        before :each do
            visit '/'
            click_link 'Register a new reader'
        end

        it "should create a reader with valid parameters" do

            fill_in 'Last name',        with: 'Edisson'
            fill_in 'First name',       with: 'Tomas'
            fill_in 'Middle name',      with: 'Alva'
            select "1976",              from:'reader_date_of_birth_1i'
            select "August",            from:'reader_date_of_birth_2i'
            select "4",                 from:'reader_date_of_birth_3i'

            fill_in 'Street',           with: 'Backer str'
            select '121',               from: 'Home number'
            select '0',                 from: 'Building'
            select '13',                from: 'Flat number'
            fill_in 'Home phone',       with: '123-45-67'

            fill_in 'Profession notes', with: 'Let it be'

            expect do
                click_button 'Change reader\'s data'
            end.to change(Reader, :count).by(1)

            expect(page).to have_content("Reader successfully created!")
        end

        it "should not create a reader with invalid parameters" do

            fill_in 'Last name',        with: ''
            fill_in 'First name',       with: ''
            fill_in 'Middle name',      with: ''
            select "1976",              from:'reader_date_of_birth_1i'
            select "August",            from:'reader_date_of_birth_2i'
            select "4",                 from:'reader_date_of_birth_3i'

            fill_in 'Street',           with: ''
            select '121',               from: 'Home number'
            select '0',                 from: 'Building'
            select '13',                from: 'Flat number'
            fill_in 'Home phone',       with: ''

            fill_in 'Profession notes', with: ''

            expect do
                click_button 'Change reader\'s data'
            end.to change(Reader, :count).by(0)

            expect(page).to have_content("7 errors prohibited this product from being saved:")
            expect(page).to have_content("First name can't be blank")
            expect(page).to have_content("Middle name can't be blank")
            expect(page).to have_content("Last name can't be blank")
            expect(page).to have_content("Home phone is invalid")
            expect(page).to have_content("Home phone can't be blank")
            expect(page).to have_content("Profession notes can't be blank")
            expect(page).to have_content("Street can't be blank") 
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
