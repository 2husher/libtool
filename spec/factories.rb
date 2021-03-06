FactoryGirl.define do 
    factory :reader do
        first_name           "Jean"
        middle_name          "Cloddte"
        last_name            "VanDamme"
        reader_card_id       "9999"
        date_of_birth        "1980-05-01"
        date_of_registration "2014-08-23"
        home_phone           "123-45-67"
        profession_notes     "Worker"
        street               "Elm str"
        home_number          "13"
        building             "4"
        flat_number          "35"
    end

    factory :book do
        identity        "ISBN 0-1234-5678-9" 
        title           "War and Peace"
        author          "Lev Tolstoy"
        publishing_year "1998-01-01"
        annotation      "A big book"
    end
end