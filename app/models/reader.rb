# == Schema Information
#
# Table name: readers
#
#  id             :integer          not null, primary key
#  reader_card_id :integer
#  name           :string(255)
#  address        :string(255)
#  notes          :text
#  is_banned      :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  date_of_birth  :date
#

class Reader < ActiveRecord::Base
#TODO: add phonenumber
    has_many :books

    validates :name, :address, presence: true
    validates :reader_card_id, length: { maximum: 4 }
end
