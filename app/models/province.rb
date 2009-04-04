class Province < ActiveRecord::Base
  belongs_to :country
  has_many :cities

  validates_presence_of :name
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  country_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

