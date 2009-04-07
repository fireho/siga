require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/index.html.erb" do
  include AddressesHelper

  before(:each) do
    assigns[:addresses] = [
      stub_model(Address,
        :street => "value for street",
        :complement => "value for complement",
        :number => "value for number",
        :zip_code => "value for zip_code"
      ),
      stub_model(Address,
        :street => "value for street",
        :complement => "value for complement",
        :number => "value for number",
        :zip_code => "value for zip_code"
      )
    ]
  end

  it "should render list of addresses" do
    render "/addresses/index.html.erb"
    response.should have_tag("tr>td", "value for street".to_s, 2)
    response.should have_tag("tr>td", "value for complement".to_s, 2)
    response.should have_tag("tr>td", "value for number".to_s, 2)
    response.should have_tag("tr>td", "value for zip_code".to_s, 2)
  end
end

