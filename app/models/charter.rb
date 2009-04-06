class Charter < ActiveRecord::Base

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['charters.title like ?', "%#{filter}%"],
    :order => 'charters.created_at'
  end
end
