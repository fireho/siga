class Person < ActiveRecord::Base
  has_many :documents
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable

  has_money :income, :revenue

  validates_presence_of :name
  validates_inclusion_of :sex, :in => [true, false]

  state_machine :state, :initial => :active do

    event :activate do
      transition all => :active
    end

    event :inactivate do
      transition :active => :inactive
    end

    event :suspend do
      transition all => :suspended
    end
  end

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: people
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  sex            :string(255)
#  marital_status :string(255)
#  birth          :date
#  birthplace     :string(255)
#  time_residence :string(255)
#  profession     :string(255)
#  income         :integer
#  housing        :string(255)
#  type_housing   :string(255)
#  type_house     :string(255)
#  room           :integer
#  revenue        :integer
#  habitantes     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

