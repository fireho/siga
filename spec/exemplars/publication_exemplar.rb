class Publication < ActiveRecord::Base
  generator_for :title, "Mega Massa"
  generator_for :body, "value for body"
  generator_for :published, true

end
