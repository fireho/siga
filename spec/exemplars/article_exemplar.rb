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

