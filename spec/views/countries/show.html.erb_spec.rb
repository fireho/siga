require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/countries/show.html.erb" do
  include CountriesHelper
  before(:each) do
    assigns[:country] = @country = stub_model(Country,
      :name => "value for name",
      :abbr => "value for abbr"
    )
  end

  it "should render attributes in <p>" do
    render "/countries/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ abbr/)
  end
end

