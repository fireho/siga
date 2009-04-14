require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/heritages/index.html.haml" do
  include HeritagesHelper

  before(:each) do
    assigns[:heritages] = [
      stub_model(Heritage,
        :name => "value for name",
        :code => "value for code",
        :value_cents => 1
      ),
      stub_model(Heritage,
        :name => "value for name",
        :code => "value for code",
        :value_cents => 1
      )
    ]
  end

  it "renders a list of heritages" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

