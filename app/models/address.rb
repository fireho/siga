class Address < ActiveRecord::Base
  attr_writer :x, :y, :z
  acts_as_geom :geom

  validates_presence_of :geom, :message => "Marque o ponto"

  # Instantiate self.geom as a Point
  def create_geom
    unless !@x || !@y || @x == "" || @y == ""
      self.geom = Point.from_x_y_z(@x.to_f,@y.to_f,@z.to_f)
    end
  end

  def self.search(search,page)
    paginate :page => page, :conditions => ['address.street like ?', "%#{search}%"],
      :order => 'address.street'
  end

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  addressable_id   :integer
#  addressable_type :string(255)
#  city_id          :integer
#  street           :string(255)
#  complement       :string(255)
#  number           :string(255)
#  zip_code         :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

