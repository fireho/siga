class Message < ActiveRecord::Base
  belongs_to :sender, :foreign_key => :from_id, :class_name => "user"
  belongs_to :receiver, :foreign_key => :to_id, :class_name => "user"
  belongs_to :parent, :foreign_key => :parent_id, :class_name => "Message"

  validates_presence_of :sender, :receiver
  validates_presence_of :subject, :body
  validates_length_of :subject, :maximum => 254

  named_scope :unread, :conditions => { :read => false }
  named_scope :old, :conditions => { :read => true }


  def to_login
    receiver.andand.login
  end

  def to_login=(name)
    self.receiver = user.find_by_login(name)
  end

  def read!
    update_attribute(:read, true)
  end

  def self.search(page=1, search="")
    paginate(:page=>page, :order=>'created_at DESC')
    #:conditions => ['subject like ?', "%#{search}%"],
  end

end

# == Schema Information
# Schema version: 20090212033414
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  from_id    :integer         not null
#  to_id      :integer         not null
#  parent_id  :integer
#  subject    :string(255)     not null
#  body       :text            not null
#  read       :boolean         not null
#  created_at :timestamp
#  updated_at :timestamp
#

