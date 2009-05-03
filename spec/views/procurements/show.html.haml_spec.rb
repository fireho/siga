require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/procurements/show.html.haml" do
  include ProcurementsHelper
  before(:each) do
    assigns[:procurement] = @procurement = stub_model(Procurement,
      :name => "value for name",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ body/)
  end
end

