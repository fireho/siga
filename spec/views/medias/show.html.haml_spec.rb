require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/medias/show.html.haml" do
  include MediasHelper
  before(:each) do
    assigns[:media] = @media = stub_model(Media,
      :info => "value for info"
    )
  end

  it "should render attributes in <p>" do
    render "/medias/show.html.haml"
    response.should have_text(/value\ for\ info/)
  end
end

