class Publication < ActiveRecord::Base
end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: publications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

