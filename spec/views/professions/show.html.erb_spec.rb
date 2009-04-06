require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/professions/show.html.erb" do
  include ProfessionsHelper
  before(:each) do
    assigns[:profession] = @profession = stub_model(Profession,
      :name => "value for name",
      :kind => "value for kind",
      :person_count => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/1/)
  end
end

