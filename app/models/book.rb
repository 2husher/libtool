# == Schema Information
#
# Table name: books
#
#  id              :integer          not null, primary key
#  reader_id       :integer
#  identity        :string(255)
#  title           :string(255)
#  author          :string(255)
#  annotation      :text
#  publishing_year :integer
#  returning_date  :date
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_books_on_reader_id  (reader_id)
#

class Book < ActiveRecord::Base
    #TODO: add return date
  belongs_to :reader

  validates :identity, :title, :author, :publishing_year, presence: true
end
