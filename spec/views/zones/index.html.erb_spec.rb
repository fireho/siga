require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zones/index.html.erb" do
  include ZonesHelper
  
  before(:each) do
    assigns[:zones] = [
      stub_model(Zone,
        :name => "value for name"
      ),
      stub_model(Zone,
        :name => "value for name"
      )
    ]
  end

  it "should render list of zones" do
    render "/zones/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

