class Storage < ActiveRecord::Base

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['storages.name like ?', "%#{filter}%"],
    :order => 'storages.created_at'
  end
end
