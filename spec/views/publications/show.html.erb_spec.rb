require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/show.html.erb" do
  include PublicationsHelper
  before(:each) do
    assigns[:publication] = @publication = stub_model(Publication,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "should render attributes in <p>" do
    render "/publications/show.html.erb"
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
  end
end

