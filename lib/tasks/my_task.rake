namespace :my_namespace do
    desc "TATAM"
    task populate_readers: :environment do
=begin
        30.times {
            first_name           = Faker::Name.first_name
            middle_name          = Faker::Name.first_name
            p last_name          = Faker::Name.last_name
            home_phone           = Faker::Number.number(7)
            home_phone_formated  = "#{home_phone[0..2]}-#{home_phone[3..4]}-#{home_phone[5..6]}"
            profession_notes     = Faker::Lorem.sentence
            street               = Faker::Address.street_name
            home_number          = Faker::Number.number(3)
            flat_number          = Faker::Number.number(3)
            building             = Faker::Number.digit
            date_of_birth        = Date.new(rand(50) + 1950, rand(12) + 1, rand(28) + 1)
            date_of_registration = Date.new(rand(50) + 1950, rand(12) + 1, rand(28) + 1)
            reader_card_max      = Reader.maximum(:reader_card_id)
            if reader_card_max.nil?
                reader_card_id = sprintf("%04d", 0)
            else
                reader_card_id = sprintf("%04d", reader_card_max.to_i + 1)
            end
            Reader.create!(is_banned:            false,
                           reader_card_id:       reader_card_id,
                           date_of_birth:        date_of_birth,
                           date_of_registration: date_of_registration,
                           first_name:           first_name,
                           middle_name:          middle_name,
                           last_name:            last_name,
                           home_phone:           home_phone_formated,
                           profession_notes:     profession_notes,
                           street:               street,
                           home_number:          home_number,
                           building:             building,
                           flat_number:          flat_number) 
        }
=end
        100.times {
            identity            = Faker::Number.number(10)
            p identity_formated = "ISBN #{identity[0]}-#{identity[1..4]}-#{identity[5..8]}-#{identity[9]}"
            title               = Faker::Company.catch_phrase
            author              = Faker::Name.name
            annotation          = Faker::Lorem.paragraph
            returning_date      = Date.today + 7.days
            publishing_year     = Date.new(rand(64) + 1950, 1, 1)
            Book.create!(identity:        identity_formated,
                         title:           title,
                         author:          author,
                         annotation:      annotation,
                         returning_date:  returning_date,
                         publishing_year: publishing_year)
        }
    end
end