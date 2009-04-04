class Publication < ActiveRecord::Base
  has_permalink :title, :update => true

end

