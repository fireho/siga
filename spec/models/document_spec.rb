require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Document do
  before(:each) do
    @valid_attributes = {
      :kind => "value for kind",
      :value => "value for value",
      :note => "value for note",
      :state => "value for state"
    }
  end

  it "should create a new instance given valid attributes" do
    Document.create!(@valid_attributes)
  end
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: documents
#
#  id                :integer         not null, primary key
#  documentable_id   :integer         not null
#  documentable_type :string(255)     not null
#  kind              :string(10)      not null
#  value             :string(255)     not null
#  extra             :string(255)
#  note              :string(255)
#  state             :string(255)
#  emitter           :string(255)
#  emit_at           :date
#  invalid_at        :date
#  created_at        :timestamp
#  updated_at        :timestamp
#

