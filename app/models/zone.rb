class Zone < ActiveRecord::Base
  acts_as_geom :geom

  has_many :properties, :dependent => :nullify

  TYPES = %w{ comercial industrial residential countryside }

  validates_presence_of :name
  validates_inclusion_of :kind, :in => TYPES

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: zones
#
#  id         :integer         not null, primary key
#  city_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

