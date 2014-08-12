# == Schema Information
#
# Table name: readers
#
#  id                   :integer          not null, primary key
#  reader_card_id       :integer
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
#

class Reader < ActiveRecord::Base
    #before_validate and save street.downcase.capitalize
    has_many :books

  #  validates :reader_card_id, :date_of_birth, :first_name, :middle_name, :last_name,
  #            :home_phone, :profession_notes, :street, :home_number, :flat_number,
  #            :date_of_registration, presence: true
    validates :first_name, :middle_name, :last_name, 
              format: { with: /\A[А-Яа-я]+\z/ }, 
              length:{ maximum: 30 }, 
              presence: true
 #   validates :reader_card_id, format: { with: /\A\d\d\d\d\z/ }
    #validates :date_of_birth, :date_of_registration
  #  validates :home_phone, format: { with: /\A\d\d\d\d\d\d\d\z/ }
    #validates :street
    validates :home_number, :flat_number, 
              format: { with: /\A\d+\z/ }, 
              length: { in: 1..4 },
              presence: true
end
