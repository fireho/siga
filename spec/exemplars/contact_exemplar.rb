class Contact < ActiveRecord::Base
  generator_for :value, "email@email.com"
  generator_for :contact_type, 'Email'
  generator_for :contactable_type, 'user'

#  def self.next_number
#    @last ||= 1456367
#    @last = @last.succ
#  end
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

