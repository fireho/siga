require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/procurements/index.html.erb" do
  include ProcurementsHelper
  
  before(:each) do
    assigns[:procurements] = [
      stub_model(Procurement,
        :name => "value for name",
        :body => "value for body"
      ),
      stub_model(Procurement,
        :name => "value for name",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of procurements" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

