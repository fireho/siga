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
