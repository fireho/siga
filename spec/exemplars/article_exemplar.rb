class Article < ActiveRecord::Base
  generator_for :title, Faker::Lorem.sentence
  generator_for :body, Faker::Lorem.paragraph
  generator_for :public, true
  generator_for :published, true

end

