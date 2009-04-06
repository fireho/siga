class Publication < ActiveRecord::Base
  has_permalink :title, :update => true


  def self.search(filter, page)
    paginate :per_page => 5, :page => page,
    :conditions => ['publication.title like ?', "%#{filter}%"],
    :order => 'publications.created_at DESC'
  end

end

