require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/officials/show.html.erb" do
  include OfficialsHelper
  before(:each) do
    assigns[:official] = @official = stub_model(Official,
      :post => "value for post"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ post/)
  end
end

