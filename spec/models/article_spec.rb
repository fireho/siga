require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Article do
  it{ Article.generate! }

  it { should belong_to(:user) }

end


# == Schema Information
# Schema version: 20090301000300
#
# Table name: articles
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  title      :string(255)     not null
#  body       :text            not null
#  permalink  :string(255)
#  public     :boolean         not null
#  published  :boolean         default(TRUE), not null
#  created_at :timestamp
#  updated_at :timestamp
#

