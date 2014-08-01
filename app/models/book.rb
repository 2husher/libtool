class Book < ActiveRecord::Base
  belongs_to :reader

  validates :identity, :title, :author, :publishing_year, presence: true
end
