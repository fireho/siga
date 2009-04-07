class Publication < ActiveRecord::Base
  generator_for :title, :method => :fake_title
  generator_for :body, :method => :fake_body
  generator_for :kind => "note"
  generator_for :published, true

  def self.fake_title
    Faker::Lorem.sentence
  end

  def self.fake_body
    out = Faker::Lorem.paragraph
    rand(5).times { out += Faker::Lorem.paragraph }
    out
  end
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: publications
#
#  id           :integer         not null, primary key
#  person_id    :integer
#  user_id      :integer         not null
#  kind         :string(255)     not null
#  title        :string(255)     not null
#  permalink    :string(255)     not null
#  published    :boolean         not null
#  published_at :timestamp
#  wrote_at     :timestamp
#  body         :text
#  created_at   :timestamp
#  updated_at   :timestamp
#

