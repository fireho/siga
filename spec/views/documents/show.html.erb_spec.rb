require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/documents/show.html.erb" do
  include DocumentsHelper
  before(:each) do
    assigns[:document] = @document = stub_model(Document,
      :kind => "value for kind",
      :value => "value for value",
      :note => "value for note",
      :state => "value for state"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ value/)
    response.should have_text(/value\ for\ note/)
    response.should have_text(/value\ for\ state/)
  end
end

