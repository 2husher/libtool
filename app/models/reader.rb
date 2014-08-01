class Reader < ActiveRecord::Base
#TODO: add phonenumber
    has_many :books

    validates :name, :birthday, :address, presence: true
    validates :reader_card_id, length: { maximum: 4 }
end
