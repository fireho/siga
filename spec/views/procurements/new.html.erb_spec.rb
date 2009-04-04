require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/procurements/new.html.erb" do
  include ProcurementsHelper
  
  before(:each) do
    assigns[:procurement] = stub_model(Procurement,
      :new_record? => true,
      :name => "value for name",
      :body => "value for body"
    )
  end

  it "renders new procurement form" do
    render
    
    response.should have_tag("form[action=?][method=post]", procurements_path) do
      with_tag("input#procurement_name[name=?]", "procurement[name]")
      with_tag("textarea#procurement_body[name=?]", "procurement[body]")
    end
  end
end


