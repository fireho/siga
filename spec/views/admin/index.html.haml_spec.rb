require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/admin/index.html.haml" do
  include AdminHelper

  before(:each) do
    assigns[:opts] = [
      stub_model(Opt,
        :key => "value for key",
        :value => "value for value"
      ),
      stub_model(Opt,
        :key => "value for key",
        :value => "value for value"
      )
    ]
  end

  it "renders a list of opts" do
    render
    response.should have_tag("tr>td", "value for key".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
  end
end

