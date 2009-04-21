require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/professions/new.html.haml" do
  include ProfessionsHelper

  before(:each) do
    assigns[:profession] = stub_model(Profession,
      :new_record? => true,
      :name => "value for name",
      :kind => "value for kind",
      :person_count => 1
    )
  end

  it "renders new profession form" do
    render

    response.should have_tag("form[action=?][method=post]", professions_path) do
      with_tag("input#profession_name[name=?]", "profession[name]")
      with_tag("select#profession_kind[name=?]", "profession[kind]")
    end
  end
end


