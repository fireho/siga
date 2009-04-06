require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bills/index.html.erb" do
  include BillsHelper
  
  before(:each) do
    assigns[:bills] = [
      stub_model(Bill,
        :kind => "value for kind",
        :title => "value for title",
        :body => "value for body",
        :value_cents => 1
      ),
      stub_model(Bill,
        :kind => "value for kind",
        :title => "value for title",
        :body => "value for body",
        :value_cents => 1
      )
    ]
  end

  it "renders a list of bills" do
    render
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

