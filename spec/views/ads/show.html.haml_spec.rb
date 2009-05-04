require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ads/show.html.haml" do
  include AdsHelper
  before(:each) do
    assigns[:ad] = @ad = stub_model(Ad,
      :title => "value for title",
      :kind => "value for kind",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ body/)
  end
end

