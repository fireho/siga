ActionView::Base.send :include, Showtastic::SemanticShowHelper

class Person < ActiveRecord::Base
  belongs_to :birthplace, :class_name => "City"
  has_many :documents
  has_many :addresses, :as => :addressable
  has_many :contacts, :as => :contactable

  has_money :income, :revenue
  has_permalink :name

  symbolize :blood, :in => [:"A+", :"A-", :"O+", :"O-", :"B+", :"B-", :"AB+", :"AB-"]
  symbolize :marital, :in => [:single, :married]
  symbolize :profession_state, :in => [:working, :retired]
  symbolize :sex, :in => ["true", "false"]

  validates_presence_of :name
 # validates_inclusion_of :sex, :in => [true, false]

  def to_param
    "#{id}-#{permalink}"
  end
  def before_save
    calc_age
  end
  state_machine :state, :initial => :active do

    event :activate do
      transition all => :active
    end

    event :inactivate do
      transition :active => :inactive
    end

    event :suspend do
      transition all => :suspended
    end
  end

  # def sex
  #   "kdkd" #{ true => "Masculino", false => "Feminino"}[self.sex]
  # end

  # def name
  #   "kdkd"
  # end

  def calc_age
    write_attribute(:age, (Time.now - born_at)/60/60/24/360)
  end


  def self.search(filter, page)
    paginate :per_page => 10, :page => page,
    :conditions => ['name like ?', "%#{filter}%"],
    :order => 'name'
  end


end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: people
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  sex            :string(255)
#  marital_status :string(255)
#  birth          :date
#  birthplace     :string(255)
#  time_residence :string(255)
#  profession     :string(255)
#  income         :integer
#  housing        :string(255)
#  type_housing   :string(255)
#  type_house     :string(255)
#  room           :integer
#  revenue        :integer
#  habitantes     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

