require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/laws/index.html.haml" do
  include LawsHelper

  before(:each) do
    assigns[:laws] = [
      stub_model(Law,
        :content => "value for content"
      ),
      stub_model(Law,
        :content => "value for content"
      )
    ]
  end

  it "renders a list of laws" do
    render
    response.should have_tag("tr>td", "value for content".to_s, 2)
  end
end

