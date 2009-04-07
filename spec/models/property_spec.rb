require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Property do

  it { should belong_to :person }
  it { should belong_to :area }

  it { Property.generate! }

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: properties
#
#  id         :integer         not null, primary key
#  area_id    :integer
#  person_id  :integer
#  name       :string(255)
#  condition  :string(20)
#  kind       :string(20)
#  road       :string(20)
#  drain      :string(20)
#  power      :string(20)
#  garbage    :string(20)
#  water      :string(20)
#  rooms      :integer
#  built_at   :date
#  info       :text
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        multi_polygon, 4326
#

