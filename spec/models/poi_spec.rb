require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poi do

  it { should have_indices :geom, :kind }

  it "should generate!" do
    @poi = Poi.generate
    @poi.should respond_to(:x,:y,:z)
  end

  it "should require type" do
    @poi = Poi.generate(:kind => nil)
    @poi.should have(1).error_on(:kind)
  end

  it "should require a poi type that exists" do
    @poi = Poi.generate(:kind => "blablablu")
    @poi.should have(1).error_on(:kind)
  end

  it "should require geom" do
    @poi = Poi.generate(:geom => nil)
    @poi.should have(1).error_on(:geom)
  end

  describe "beautiful Poi" do

    def pt(x,y);      Point.from_x_y_z(x,y,0); end

    before(:each) do
      @poi_perto = Poi.generate(:geom => pt(5,5))
      @poi_medio = Poi.generate(:geom => pt(20,20))
      @poi_longe = Poi.generate(:geom => pt(40,40))
      @ponto = pt(8,8)
    end

    it "should find the closest point" do
      @poi = Poi.closest_to(@ponto)
      @poi.should eql(@poi_perto)
    end

    it "should find the closest" do
      @poi = Poi.close_to(@ponto).first(2)
      @poi.should eql([@poi_perto,@poi_medio])
    end
  end

end





# == Schema Information
# Schema version: 99999999999999
#
# Table name: pois
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  kind       :string(20)      default("poi"), not null
#  created_at :timestamp
#  updated_at :timestamp
#  geom       :geometry        not null, point, 4326
#

