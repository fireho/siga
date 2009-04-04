require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/registers/new.html.erb" do
  include RegistersHelper
  
  before(:each) do
    assigns[:register] = stub_model(Register,
      :new_record? => true,
      :name => "value for name",
      :value_cents => 1,
      :sign => false
    )
  end

  it "renders new register form" do
    render
    
    response.should have_tag("form[action=?][method=post]", registers_path) do
      with_tag("input#register_name[name=?]", "register[name]")
      with_tag("input#register_value_cents[name=?]", "register[value_cents]")
      with_tag("input#register_sign[name=?]", "register[sign]")
    end
  end
end


