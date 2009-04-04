require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/charters/new.html.erb" do
  include ChartersHelper
  
  before(:each) do
    assigns[:charter] = stub_model(Charter,
      :new_record? => true,
      :code => "value for code",
      :restrictions => "value for restrictions"
    )
  end

  it "renders new charter form" do
    render
    
    response.should have_tag("form[action=?][method=post]", charters_path) do
      with_tag("input#charter_code[name=?]", "charter[code]")
      with_tag("textarea#charter_restrictions[name=?]", "charter[restrictions]")
    end
  end
end


