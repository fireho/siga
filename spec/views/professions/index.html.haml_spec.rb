require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/professions/index.html.haml" do
  include ProfessionsHelper

  before(:each) do
    assigns[:professions] = [
      stub_model(Profession,
        :name => "value for name",
        :kind => "value for kind",
        :person_count => 1
      ),
      stub_model(Profession,
        :name => "value for name",
        :kind => "value for kind",
        :person_count => 1
      )
    ]
  end

  it "renders a list of professions" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    # response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

