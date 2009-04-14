require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/laws/show.html.haml" do
  include LawsHelper
  before(:each) do
    assigns[:law] = @law = stub_model(Law,
      :content => "value for content"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ content/)
  end
end

