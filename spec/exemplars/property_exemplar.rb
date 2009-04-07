class Property < ActiveRecord::Base
  generator_for :kind => :masonry
  generator_for :use => :public
end
