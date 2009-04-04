class Area < ActiveRecord::Base
  belongs_to :zone
  has_many :properties

end
