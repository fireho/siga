require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/areas/show.html.haml" do
  include AreasHelper
  before(:each) do
    assigns[:area] = @area = stub_model(Area,
      :name => "value for name",
      :kind => "value for kind",
      :geom => mock("Geom")
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ kind/)
  end
end

