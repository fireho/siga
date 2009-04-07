class Publication < ActiveRecord::Base
  belongs_to :person
  belongs_to :user
  has_permalink :title, :update => true

  validates_presence_of :user

  symbolize :kind, :in => [:edict, :decree, :order, :note]

  def self.search(filter, page)
    paginate :per_page => 5, :page => page,
    :conditions => ['publications.title like ?', "%#{filter}%"],
    :order => 'publications.created_at DESC'
  end

end

