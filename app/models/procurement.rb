class Procurement < ActiveRecord::Base

  validates_presence_of :title

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['procurements.title like ?', "%#{filter}%"],
    :order => 'procurements.created_at'
  end
end
