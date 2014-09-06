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
#  returning_date  :date
#  created_at      :datetime
#  updated_at      :datetime
#  publishing_year :date
#
# Indexes
#
#  index_books_on_identity  (identity) UNIQUE
#

class Book < ActiveRecord::Base
  belongs_to :reader

  default_scope { order(:returning_date) }

  scope :free, -> { where(reader_id: nil) }

  validates :identity, uniqueness: true,
            presence: true
  validates :title,
            presence: true
  validates :author,
            presence: true
  validates :publishing_year, format: { with:/\A\d\d\d\d-\d\d-\d\d\z/ },
            presence: true
  validates :annotation,
            presence: true
end
