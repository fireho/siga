require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/charters/edit.html.erb" do
  include ChartersHelper
  
  before(:each) do
    assigns[:charter] = @charter = stub_model(Charter,
      :new_record? => false,
      :code => "value for code",
      :restrictions => "value for restrictions"
    )
  end

  it "renders the edit charter form" do
    render
    
    response.should have_tag("form[action=#{charter_path(@charter)}][method=post]") do
      with_tag('input#charter_code[name=?]', "charter[code]")
      with_tag('textarea#charter_restrictions[name=?]', "charter[restrictions]")
    end
  end
end


