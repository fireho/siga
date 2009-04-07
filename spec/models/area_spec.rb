require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Area do
  it { Area.generate }

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: areas
#
#  id         :integer         not null, primary key
#  person_id  :integer
#  zone_id    :integer
#  name       :string(255)
#  kind       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        polygon, 4326
#

