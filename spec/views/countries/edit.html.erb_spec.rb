require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/countries/edit.html.erb" do
  include CountriesHelper
  
  before(:each) do
    assigns[:country] = @country = stub_model(Country,
      :new_record? => false,
      :name => "value for name",
      :abbr => "value for abbr"
    )
  end

  it "should render edit form" do
    render "/countries/edit.html.erb"
    
    response.should have_tag("form[action=#{country_path(@country)}][method=post]") do
      with_tag('input#country_name[name=?]', "country[name]")
      with_tag('input#country_abbr[name=?]', "country[abbr]")
    end
  end
end


