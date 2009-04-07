require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Attachment do


end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: attachments
#
#  id                 :integer         not null, primary key
#  attachable_id      :integer
#  attachable_type    :string(255)
#  media_file_name    :string(255)
#  media_content_type :string(255)
#  media_file_size    :integer
#  media_updated_at   :timestamp
#  info               :text
#  created_at         :timestamp
#  updated_at         :timestamp
#

