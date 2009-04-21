require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/properties/edit.html.haml" do
  include PropertiesHelper

  before(:each) do
    assigns[:property] = @property = stub_model(Property,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit property form" do
    render

    response.should have_tag("form[action=#{property_path(@property)}][method=post]") do
      with_tag('input#property_name[name=?]', "property[name]")
    end
  end
end


