require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/countries/new.html.erb" do
  include CountriesHelper
  
  before(:each) do
    assigns[:country] = stub_model(Country,
      :new_record? => true,
      :name => "value for name",
      :abbr => "value for abbr"
    )
  end

  it "should render new form" do
    render "/countries/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", countries_path) do
      with_tag("input#country_name[name=?]", "country[name]")
      with_tag("input#country_abbr[name=?]", "country[abbr]")
    end
  end
end


