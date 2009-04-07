require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Procurement do
  it { Procurement.generate! }

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: procurements
#
#  id          :integer         not null, primary key
#  title       :string(255)     not null
#  body        :text            not null
#  limit_cents :integer
#  value_cents :integer
#  due_at      :timestamp
#  created_at  :timestamp
#  updated_at  :timestamp
#

