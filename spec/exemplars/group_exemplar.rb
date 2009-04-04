class Group < ActiveRecord::Base
  generator_for :name, :method => :next_group_name
  generator_for :state => 'active'
  
  def self.next_group_name
    @last ||= "Leva e Ja foi"
    @last = @last.succ
  end
end




# == Schema Information
# Schema version: 20090301000300
#
# Table name: groups
#
#  id             :integer         not null, primary key
#  manager_id     :integer
#  name           :string(100)     not null
#  state          :string(10)      not null
#  city_id        :integer
#  doc1           :string(20)
#  doc2           :string(20)
#  endereco       :string(255)
#  bairro         :string(50)
#  numero         :string(20)
#  site           :string(50)
#  cep            :string(8)
#  created_at     :timestamp
#  updated_at     :timestamp
#  profiles_count :integer         default(0)
#

