require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Message do

  it "should generate" do
    Message.generate!
  end

end

# == Schema Information
# Schema version: 20090212033414
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  from_id    :integer         not null
#  to_id      :integer         not null
#  parent_id  :integer
#  subject    :string(255)     not null
#  body       :text            not null
#  read       :boolean         not null
#  created_at :timestamp
#  updated_at :timestamp
#

