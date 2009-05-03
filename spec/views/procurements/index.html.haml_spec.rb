require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/procurements/index.html.haml" do
  include ProcurementsHelper

  before(:each) do
    assigns[:procurements] = @p = [
      stub_model(Procurement,
        :title => "value for name",
        :body => "value for body"
      ),
      stub_model(Procurement,
        :title => "value for name",
        :body => "value for body"
      )
    ]
    @p.should_receive(:total_pages).and_return(1)
  end

  it "renders a list of procurements" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

