require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Publication do

  it "should create a new instance given valid attributes" do
    Publication.generate!
  end

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: publications
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  user_id      :integer         not null
#  kind         :string(255)     not null
#  title        :string(255)     not null
#  permalink    :string(255)     not null
#  published    :boolean         not null
#  published_at :timestamp
#  wrote_at     :timestamp
#  body         :text
#  created_at   :timestamp
#  updated_at   :timestamp
#

