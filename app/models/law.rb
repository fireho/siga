class Law < ActiveRecord::Base
  acts_as_nested_set
  belongs_to :user

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['laws.title like ?', "%#{filter}%"],
    :order => 'laws.created_at'
  end
end
