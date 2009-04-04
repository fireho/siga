require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/index.html.erb" do
  include PublicationsHelper
  
  before(:each) do
    assigns[:publications] = [
      stub_model(Publication,
        :title => "value for title",
        :body => "value for body"
      ),
      stub_model(Publication,
        :title => "value for title",
        :body => "value for body"
      )
    ]
  end

  it "should render list of publications" do
    render "/publications/index.html.erb"
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

