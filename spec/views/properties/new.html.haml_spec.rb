require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/properties/new.html.haml" do
  include PropertiesHelper

  before(:each) do
    assigns[:property] = stub_model(Property,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new property form" do
    render

    response.should have_tag("form[action=?][method=post]", properties_path) do
      with_tag("input#property_name[name=?]", "property[name]")
    end
  end
end


