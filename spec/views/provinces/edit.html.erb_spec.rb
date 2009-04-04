require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/provinces/edit.html.erb" do
  include ProvincesHelper
  
  before(:each) do
    assigns[:province] = @province = stub_model(Province,
      :new_record? => false,
      :name => "value for name",
      :pop => 1
    )
  end

  it "should render edit form" do
    render "/provinces/edit.html.erb"
    
    response.should have_tag("form[action=#{province_path(@province)}][method=post]") do
      with_tag('input#province_name[name=?]', "province[name]")
      with_tag('input#province_pop[name=?]', "province[pop]")
    end
  end
end


