class Procurement < ActiveRecord::Base
  generator_for :title, Faker::Lorem.sentence
  generator_for :body, Faker::Lorem.paragraph
  #generator_for :public, true
  #generator_for :published, true

end


# == Schema Information
# Schema version: 99999999999999
#
# Table name: procurements
#
#  id          :integer         not null, primary key
#  title       :string(255)     not null
#  body        :text            not null
#  limit_cents :integer
#  value_cents :integer
#  due_at      :timestamp
#  created_at  :timestamp
#  updated_at  :timestamp
#

