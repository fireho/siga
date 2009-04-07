require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contact do
  it { Contact.generate! }


end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: contacts
#
#  id               :integer         not null, primary key
#  contactable_id   :integer
#  contactable_type :string(255)
#  kind             :string(20)      not null
#  value            :string(30)      not null
#  info             :string(255)
#  created_at       :timestamp
#  updated_at       :timestamp
#

