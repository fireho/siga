require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/properties/index.html.haml" do
  include PropertiesHelper

  before(:each) do
    assigns[:properties] = @p = [
      stub_model(Property,
        :name => "value for name"
      ),
      stub_model(Property,
        :name => "value for name"
      )
    ]
    @p.should_receive(:total_pages).and_return(1)
  end

  it "renders a list of properties" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

