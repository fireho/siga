class Person < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :born_at => 50.years.ago
  generator_for :blood => "A+"
  generator_for :marital, :single
  generator_for :profession_state => :working
  generator_for :sex => true

  def self.next_name
    Faker::Name.name
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: people
#
#  id               :integer         not null, primary key
#  country_id       :integer
#  name             :string(255)     not null
#  permalink        :string(255)     not null
#  state            :string(255)     not null
#  sex              :boolean         not null
#  marital          :string(255)
#  education        :string(255)
#  profession       :string(255)
#  profession_state :string(255)
#  prefix           :string(5)
#  blood            :string(5)
#  race             :string(5)
#  revenue_cents    :integer
#  age              :integer
#  height           :integer
#  weight           :integer
#  birthplace_id    :integer
#  mom_id           :integer
#  dad_id           :integer
#  spouse_id        :integer
#  born_at          :timestamp
#  arrival_at       :date
#  leave_at         :date
#  created_at       :timestamp
#  updated_at       :timestamp
#

