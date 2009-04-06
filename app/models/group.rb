class Group < ActiveRecord::Base

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['groups.name like ?', "%#{filter}%"],
    :order => 'groups.created_at'
  end
end
