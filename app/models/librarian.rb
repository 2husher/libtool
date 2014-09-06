# == Schema Information
#
# Table name: librarians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  birth_date :date
#

class Librarian < ActiveRecord::Base
    validates :name, presence: true
    validates :birth_date, format: { with:/\A\d\d\d\d-\d\d-\d\d\z/ },
              presence: true
end
