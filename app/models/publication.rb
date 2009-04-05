class Publication < ActiveRecord::Base
  has_permalink :title, :update => true


  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['title like ?', "%#{filter}%"],
    :order => 'title'
  end

end

