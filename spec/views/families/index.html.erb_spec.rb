require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/families/index.html.erb" do
  include FamiliesHelper
  
  before(:each) do
    assigns[:families] = [
      stub_model(Family,
        :name => "value for name",
        :people_count => 1,
        :revenue_cents => 1,
        :kind => "value for kind",
        :state => "value for state"
      ),
      stub_model(Family,
        :name => "value for name",
        :people_count => 1,
        :revenue_cents => 1,
        :kind => "value for kind",
        :state => "value for state"
      )
    ]
  end

  it "renders a list of families" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
  end
end

