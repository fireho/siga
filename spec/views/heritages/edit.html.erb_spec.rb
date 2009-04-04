require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/heritages/edit.html.erb" do
  include HeritagesHelper
  
  before(:each) do
    assigns[:heritage] = @heritage = stub_model(Heritage,
      :new_record? => false,
      :name => "value for name",
      :code => "value for code",
      :value_cents => 1
    )
  end

  it "renders the edit heritage form" do
    render
    
    response.should have_tag("form[action=#{heritage_path(@heritage)}][method=post]") do
      with_tag('input#heritage_name[name=?]', "heritage[name]")
      with_tag('input#heritage_code[name=?]', "heritage[code]")
      with_tag('input#heritage_value_cents[name=?]', "heritage[value_cents]")
    end
  end
end


