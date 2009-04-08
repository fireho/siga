class Group < ActiveRecord::Base
  generator_for :name, :method => :next_group_name
  generator_for :official_name, :method => :next_group_name
  generator_for :kind => :filantropic

  # generator_for :state => 'active'

  def self.next_group_name
    @last ||= "Yoyodine Ltda"
    @last = @last.succ
  end
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: groups
#
#  id            :integer         not null, primary key
#  name          :string(255)     not null
#  official_name :string(255)     not null
#  kind          :string(255)
#  state         :string(255)
#  creation      :date
#  created_at    :timestamp
#  updated_at    :timestamp
#

