class Relative < ActiveRecord::Base
  belongs_to :person
  belongs_to :other
end
