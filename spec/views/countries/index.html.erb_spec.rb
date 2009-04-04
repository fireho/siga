require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/countries/index.html.erb" do
  include CountriesHelper
  
  before(:each) do
    assigns[:countries] = [
      stub_model(Country,
        :name => "value for name",
        :abbr => "value for abbr"
      ),
      stub_model(Country,
        :name => "value for name",
        :abbr => "value for abbr"
      )
    ]
  end

  it "should render list of countries" do
    render "/countries/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for abbr".to_s, 2)
  end
end

