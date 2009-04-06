require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/receipts/index.html.erb" do
  include ReceiptsHelper
  
  before(:each) do
    assigns[:receipts] = [
      stub_model(Receipt,
        :kind => "value for kind",
        :title => "value for title",
        :body => "value for body",
        :value_cents => 1
      ),
      stub_model(Receipt,
        :kind => "value for kind",
        :title => "value for title",
        :body => "value for body",
        :value_cents => 1
      )
    ]
  end

  it "renders a list of receipts" do
    render
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

