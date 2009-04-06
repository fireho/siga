require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/families/show.html.erb" do
  include FamiliesHelper
  before(:each) do
    assigns[:family] = @family = stub_model(Family,
      :name => "value for name",
      :people_count => 1,
      :revenue_cents => 1,
      :kind => "value for kind",
      :state => "value for state"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ state/)
  end
end

