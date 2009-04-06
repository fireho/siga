require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/professions/edit.html.erb" do
  include ProfessionsHelper
  
  before(:each) do
    assigns[:profession] = @profession = stub_model(Profession,
      :new_record? => false,
      :name => "value for name",
      :kind => "value for kind",
      :person_count => 1
    )
  end

  it "renders the edit profession form" do
    render
    
    response.should have_tag("form[action=#{profession_path(@profession)}][method=post]") do
      with_tag('input#profession_name[name=?]', "profession[name]")
      with_tag('input#profession_kind[name=?]', "profession[kind]")
      with_tag('input#profession_person_count[name=?]', "profession[person_count]")
    end
  end
end


