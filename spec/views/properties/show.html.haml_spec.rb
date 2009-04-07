require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/properties/show.html.erb" do
  include PropertiesHelper
  before(:each) do
    assigns[:property] = @property = stub_model(Property,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end

