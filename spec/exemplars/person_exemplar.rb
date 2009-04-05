class Person < ActiveRecord::Base
  generator_for :name => "Santos Dummont"
  generator_for :born_at => 50.years.ago
  generator_for :blood => "A+"
  generator_for :marital, :single

end
