require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/storages/show.html.erb" do
  include StoragesHelper
  before(:each) do
    assigns[:storage] = @storage = stub_model(Storage,
      :amount => "value for amount",
      :unit => "value for unit",
      :value_cents => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ amount/)
    response.should have_text(/value\ for\ unit/)
    response.should have_text(/1/)
  end
end

