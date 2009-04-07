class Country < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :abbr, :method => :next_abbr
  
  def self.next_name
    @last ||= 'Brasil'
    @last = @last.succ
  end
  
  def self.next_abbr
    @last_sig ||= 'BR'
    @last_sig = @last_sig.succ
  end
end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

