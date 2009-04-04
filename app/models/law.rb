class Law < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :user

end
