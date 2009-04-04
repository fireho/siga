require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/registers/edit.html.erb" do
  include RegistersHelper
  
  before(:each) do
    assigns[:register] = @register = stub_model(Register,
      :new_record? => false,
      :name => "value for name",
      :value_cents => 1,
      :sign => false
    )
  end

  it "renders the edit register form" do
    render
    
    response.should have_tag("form[action=#{register_path(@register)}][method=post]") do
      with_tag('input#register_name[name=?]', "register[name]")
      with_tag('input#register_value_cents[name=?]', "register[value_cents]")
      with_tag('input#register_sign[name=?]', "register[sign]")
    end
  end
end


