require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zones/edit.html.haml" do
  include ZonesHelper

  before(:each) do
    assigns[:zone] = @zone = stub_model(Zone,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "should render edit form" do
    render "/zones/edit.html.haml"

    response.should have_tag("form[action=#{zone_path(@zone)}][method=post]") do
      with_tag('input#zone_name[name=?]', "zone[name]")
    end
  end
end


