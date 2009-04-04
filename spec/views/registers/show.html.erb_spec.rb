require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/registers/show.html.erb" do
  include RegistersHelper
  before(:each) do
    assigns[:register] = @register = stub_model(Register,
      :name => "value for name",
      :value_cents => 1,
      :sign => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/false/)
  end
end

