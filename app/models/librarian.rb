# == Schema Information
#
# Table name: librarians
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birthday   :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Librarian < ActiveRecord::Base
end
