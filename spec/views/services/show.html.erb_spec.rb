require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/show.html.erb" do
  include ServicesHelper
  before(:each) do
    assigns[:service] = @service = stub_model(Service,
      :name => "value for name",
      :kind => "value for kind",
      :value_cents => 1,
      :done => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/1/)
    response.should have_text(/false/)
  end
end

