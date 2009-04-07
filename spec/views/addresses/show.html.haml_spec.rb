require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/show.html.erb" do
  include AddressesHelper
  before(:each) do
    assigns[:address] = @address = stub_model(Address,
      :street => "value for street",
      :complement => "value for complement",
      :number => "value for number",
      :zip_code => "value for zip_code"
    )
  end

  it "should render attributes in <p>" do
    render "/addresses/show.html.erb"
    response.should have_text(/value\ for\ street/)
    response.should have_text(/value\ for\ complement/)
    response.should have_text(/value\ for\ number/)
    response.should have_text(/value\ for\ zip_code/)
  end
end

