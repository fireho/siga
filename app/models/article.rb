class Article < ActiveRecord::Base
  belongs_to :user
  has_permalink :title, :update => true

  validates_presence_of :user
  validates_presence_of :title, :body

  named_scope :publica, :conditions => { :public => true }
  named_scope :published, :conditions => { :published => true }
  named_scope :ordered, :order => "created_at desc"
  named_scope :with_user, :include => [:user]
  named_scope :last_five, :limit => 5

  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['articles.title like ?', "%#{filter}%"],
    :order => 'articles.created_at'
  end
end

