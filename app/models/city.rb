class City < ActiveRecord::Base
  belongs_to :province
  has_many :zones

  validates_presence_of :name
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: cities
#
#  id          :integer         not null, primary key
#  country_id  :integer
#  province_id :integer
#  name        :string(255)
#  pop         :integer
#  created_at  :datetime
#  updated_at  :datetime
#

