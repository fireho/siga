require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/provinces/new.html.erb" do
  include ProvincesHelper
  
  before(:each) do
    assigns[:province] = stub_model(Province,
      :new_record? => true,
      :name => "value for name",
      :pop => 1
    )
  end

  it "should render new form" do
    render "/provinces/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", provinces_path) do
      with_tag("input#province_name[name=?]", "province[name]")
      with_tag("input#province_pop[name=?]", "province[pop]")
    end
  end
end


