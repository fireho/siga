require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/index.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contacts] = [
      stub_model(Contact,
        :kind => "value for kind",
        :value => "value for value",
        :info => "value for info"
      ),
      stub_model(Contact,
        :kind => "value for kind",
        :value => "value for value",
        :info => "value for info"
      )
    ]
  end

  it "should render list of contacts" do
    render "/contacts/index.html.erb"
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
    response.should have_tag("tr>td", "value for info".to_s, 2)
  end
end

