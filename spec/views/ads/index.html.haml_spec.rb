require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ads/index.html.haml" do
  include AdsHelper

  before(:each) do
    assigns[:ads] = [
      stub_model(Ad,
        :title => "value for title",
        :kind => "value for kind",
        :body => "value for body"
      ),
      stub_model(Ad,
        :title => "value for title",
        :kind => "value for kind",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of ads" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

