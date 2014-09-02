require 'spec_helper'

describe "Reader pages" do

    subject { page }

    describe "new" do
#        before do
#            visit '/'
#            click_link 'Register a new reader'
#        end
        let(:change_button){ 'Change reader\'s data' }
        before { visit new_reader_path }

        it { should have_title("New Reader | Library") }
        it { should have_content("New reader registration") }

        describe "with valid parameters" do
            before  do
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
            end
            
            it "should create a new reader" do
                expect { click_button change_button}.to change(Reader, :count).by(1)
            end

            describe "after saving reader" do

                before { click_button change_button}
                let(:reader){ Reader.find_by(reader_card_id: '0000') }

                it { should have_content(reader.first_name) }
                it { should have_content(reader.middle_name) }
                it { should have_content(reader.last_name) }
                #it { should have_content(reader.date_of_birth) }
                it { should have_content(reader.street) }
                it { should have_content(reader.home_number) }
                it { should have_content(reader.building) }
                it { should have_content(reader.flat_number) }
                it { should have_content(reader.home_phone) }
                it { should have_content(reader.profession_notes) }
                #it { should have_content(reader.date_of_registration) }
                it { should have_content(reader.reader_card_id) }
                it { should have_selector('div.notice', text: 'Reader successfully created!') }
            end
        end

        describe "with invalid parameters" do
            
            it "should not create a new reader" do
                expect { click_button change_button}.not_to change(Reader, :count)
            end

            describe "after clicking button" do

                before { click_button change_button}
                
                it { should have_content("prohibited this product from being saved:") }
                it { should have_selector('div.error', text: "Can't save sorry:(") }
            end
        end
    end

    describe "index" do

        before { visit readers_path }

        it { should have_title("All Readers | Library") }
        it { should have_content("All Readers") }

        #describe "paginate" do
        
        #describe "all readers" after creating in FactoryGirl readers

        #describe "delete a reader"

        #describe ""
    end

    describe "show" do
        let(:reader) { FactoryGirl.create(:reader) }
        before { visit reader_path(reader) }

        describe "page" do
            it { should have_title("#{reader.reader_card_id} | Library") }
            it { should have_content("Reader's information") }
        end
    end

            #describe "a new reader"

            #describe "reader's books"
    

    #describe "delete a reader"

    describe "edit" do
        let(:update_button){ "Update reader's data" }
        let(:reader) { FactoryGirl.create(:reader) }
        before { visit edit_reader_path(reader) }

        describe "page" do
            it { should have_title("Edit Reader | Library") }
            it { should have_content("Change reader's information") }
        end

        describe "with valid information" do

            let(:new_first_name){ "Ostap" }
            let(:new_middle_name){ "Maria" }
            let(:new_last_name){ "Bender" }
            let(:new_year){ "1944" }
            let(:new_month){ "December" }
            let(:new_month_index){ "12" }
            let(:new_day){ "22" }
            let(:new_street){ "Sezam str" }
            let(:new_home_number){ 7 }
            let(:new_building){ 2 }
            let(:new_flat_number){ 88 }
            let(:new_home_phone){ "987-65-43" }
            let(:new_profession_notes){ "Oh yeah" }

            before do
                fill_in 'Last name',        with: new_last_name
                fill_in 'First name',       with: new_first_name
                fill_in 'Middle name',      with: new_middle_name
                select new_year,            from:'reader_date_of_birth_1i'
                select new_month,           from:'reader_date_of_birth_2i'
                select new_day,             from:'reader_date_of_birth_3i'
                fill_in 'Street',           with: new_street
                select new_home_number,     from: 'Home number'
                select new_building,        from: 'Building'
                select new_flat_number,     from: 'Flat number'
                fill_in 'Home phone',       with: new_home_phone
                fill_in 'Profession notes', with: new_profession_notes

                click_button update_button
            end

            it { should have_selector('div.notice', 'Reader successfully updated!') }
            specify{ expect(reader.reload.first_name).to eq new_first_name }
            specify{ expect(reader.reload.middle_name).to eq new_middle_name }
            specify{ expect(reader.reload.last_name).to eq new_last_name }
            specify{ expect(reader.reload.date_of_birth.to_s).to eq "#{new_year}-#{new_month_index}-#{new_day}" }
            specify{ expect(reader.reload.street).to eq new_street }
            specify{ expect(reader.reload.home_number).to eq new_home_number }
            specify{ expect(reader.reload.building).to eq new_building }
            specify{ expect(reader.reload.flat_number).to eq new_flat_number }
            specify{ expect(reader.reload.home_phone).to eq new_home_phone }
            specify{ expect(reader.reload.profession_notes).to eq new_profession_notes }
        end

        describe "with invalid information" do
            before do
                fill_in "First name", with: ""
                click_button update_button
            end

            it { should have_selector('div.error', "Can't save sorry:(") }
            it { should have_content("Change reader's information") }
        end
    end
end
