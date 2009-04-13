require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zones/show.html.haml" do
  include ZonesHelper
  before(:each) do
    assigns[:zone] = @zone = stub_model(Zone,
      :name => "value for name"
    )
  end

  it "should render attributes in <p>" do
    render "/zones/show.html.haml"
    response.should have_text(/value\ for\ name/)
  end
end

