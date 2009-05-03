require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/officials/index.html.haml" do
  include OfficialsHelper

  before(:each) do
    assigns[:officials] = [
      stub_model(Official,
        :post => "value for post"
      ),
      stub_model(Official,
        :post => "value for post"
      )
    ]
  end

  it "renders a list of officials" do
    render
    response.should have_tag("tr>td", "value for post".to_s, 2)
  end
end

