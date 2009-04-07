class Article < ActiveRecord::Base
  generator_for :public, true
  generator_for :title, :method => :fake_title
  generator_for :body, :method => :fake_body
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
# Table name: articles
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  title      :string(255)     not null
#  permalink  :string(255)     not null
#  body       :text            not null
#  public     :boolean         not null
#  published  :boolean         not null
#  created_at :timestamp
#  updated_at :timestamp
#

