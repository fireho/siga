require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/new.html.erb" do
  include CitiesHelper
  
  before(:each) do
    assigns[:city] = stub_model(City,
      :new_record? => true,
      :name => "value for name",
      :pop => 1
    )
  end

  it "should render new form" do
    render "/cities/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", cities_path) do
      with_tag("input#city_name[name=?]", "city[name]")
      with_tag("input#city_pop[name=?]", "city[pop]")
    end
  end
end


