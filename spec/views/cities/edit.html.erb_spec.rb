require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/edit.html.erb" do
  include CitiesHelper
  
  before(:each) do
    assigns[:city] = @city = stub_model(City,
      :new_record? => false,
      :name => "value for name",
      :pop => 1
    )
  end

  it "should render edit form" do
    render "/cities/edit.html.erb"
    
    response.should have_tag("form[action=#{city_path(@city)}][method=post]") do
      with_tag('input#city_name[name=?]', "city[name]")
      with_tag('input#city_pop[name=?]', "city[pop]")
    end
  end
end


