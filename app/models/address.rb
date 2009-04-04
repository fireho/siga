class Address < ActiveRecord::Base
  
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  city_id          :integer
#  street           :string(255)
#  complement       :string(255)
#  number           :string(255)
#  zip_code         :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

