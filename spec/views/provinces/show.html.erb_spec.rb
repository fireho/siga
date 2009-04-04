require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/provinces/show.html.erb" do
  include ProvincesHelper
  before(:each) do
    assigns[:province] = @province = stub_model(Province,
      :name => "value for name",
      :pop => 1
    )
  end

  it "should render attributes in <p>" do
    render "/provinces/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
  end
end

