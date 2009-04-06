class Heritage < ActiveRecord::Base

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['heritages.name like ?', "%#{filter}%"],
    :order => 'heritages.created_at'
  end
end
