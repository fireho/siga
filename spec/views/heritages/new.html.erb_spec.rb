require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/heritages/new.html.erb" do
  include HeritagesHelper
  
  before(:each) do
    assigns[:heritage] = stub_model(Heritage,
      :new_record? => true,
      :name => "value for name",
      :code => "value for code",
      :value_cents => 1
    )
  end

  it "renders new heritage form" do
    render
    
    response.should have_tag("form[action=?][method=post]", heritages_path) do
      with_tag("input#heritage_name[name=?]", "heritage[name]")
      with_tag("input#heritage_code[name=?]", "heritage[code]")
      with_tag("input#heritage_value_cents[name=?]", "heritage[value_cents]")
    end
  end
end


