require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/heritages/show.html.haml" do
  include HeritagesHelper
  before(:each) do
    assigns[:heritage] = @heritage = stub_model(Heritage,
      :name => "value for name",
      :code => "value for code",
      :value_cents => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ code/)
    response.should have_text(/1/)
  end
end

