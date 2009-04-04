require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/documents/index.html.erb" do
  include DocumentsHelper
  
  before(:each) do
    assigns[:documents] = [
      stub_model(Document,
        :kind => "value for kind",
        :value => "value for value",
        :note => "value for note",
        :state => "value for state"
      ),
      stub_model(Document,
        :kind => "value for kind",
        :value => "value for value",
        :note => "value for note",
        :state => "value for state"
      )
    ]
  end

  it "renders a list of documents" do
    render
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
    response.should have_tag("tr>td", "value for note".to_s, 2)
    response.should have_tag("tr>td", "value for state".to_s, 2)
  end
end

