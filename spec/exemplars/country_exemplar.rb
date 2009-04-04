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
# Schema version: 20090301000300
#
# Table name: countries
#
#  id   :integer         not null, primary key
#  name :string(30)      not null
#  abbr :string(2)       not null
#

