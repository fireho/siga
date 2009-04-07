require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/show.html.haml" do
  include PublicationsHelper
  before(:each) do
    assigns[:publication] = @publication = stub_model(Publication,
      :title => "value for title",
      :body => "value for body",
      :created_at => Time.now
    )
  end

  it "should render attributes in <p>" do
    render "/publications/show.html.haml"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
  end
end

