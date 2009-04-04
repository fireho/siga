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
# Schema version: 20090301000300
#
# Table name: contacts
#
#  id               :integer         not null, primary key
#  contactable_id   :integer
#  contactable_type :string(50)
#  contact_type     :string(10)      not null
#  value            :string(50)      not null
#  info             :string(255)
#

