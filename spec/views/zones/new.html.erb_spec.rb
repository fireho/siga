require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zones/new.html.erb" do
  include ZonesHelper
  
  before(:each) do
    assigns[:zone] = stub_model(Zone,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "should render new form" do
    render "/zones/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", zones_path) do
      with_tag("input#zone_name[name=?]", "zone[name]")
    end
  end
end


