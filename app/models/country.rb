class Country < ActiveRecord::Base
  has_many :provinces

  validates_presence_of :name
  validates_presence_of :abbr

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

