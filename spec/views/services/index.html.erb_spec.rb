require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/index.html.erb" do
  include ServicesHelper
  
  before(:each) do
    assigns[:services] = [
      stub_model(Service,
        :name => "value for name",
        :kind => "value for kind",
        :value_cents => 1,
        :done => false
      ),
      stub_model(Service,
        :name => "value for name",
        :kind => "value for kind",
        :value_cents => 1,
        :done => false
      )
    ]
  end

  it "renders a list of services" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end

