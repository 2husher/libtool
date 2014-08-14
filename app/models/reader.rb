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
#  index_readers_on_reader_card_id  (reader_card_id)
#

class Reader < ActiveRecord::Base
    has_many :books

    validates :first_name, :middle_name, :last_name, 
              format: { with: /\A[A-Za-z]+\z/ }, 
              length:{ maximum: 30 }, 
              presence: true
    validates :reader_card_id,  uniqueness: true, format: { with: /\A\d\d\d\d\z/ },
              presence: true
    validates :date_of_birth, :date_of_registration,
              format: { with:/\A\d\d\d\d-\d\d-\d\d\z/ },
              presence: true
    validates :home_phone, format: { with: /\A\d\d\d-\d\d-\d\d\z/ },
              presence: true
    validates :profession_notes, :street,
              presence: true
    validates :home_number, :flat_number, 
              format: { with: /\A\d+\z/ }, 
              length: { in: 1..4 },
              presence: true
    validates :building, format: { with: /\A\d*\z/ },
              length: { maximum: 3 }

    def age
        date_from = Date.today
        date_orig = self.date_of_birth
        age = date_from.year - date_orig.year
        age -= 1 if date_from.month < date_orig.month || 
                   (date_from.month == date_orig.month) && (date_from.day < date_from.day)
        age
    end
end
