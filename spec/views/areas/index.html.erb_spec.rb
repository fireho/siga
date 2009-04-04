require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/areas/index.html.erb" do
  include AreasHelper

  before(:each) do
    assigns[:areas] = [
      stub_model(Area,
        :name => "value for name",
        :kind => "value for kind"
      ),
      stub_model(Area,
        :name => "value for name",
        :kind => "value for kind"
      )
    ]
  end

  it "renders a list of areas" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
  end
end

