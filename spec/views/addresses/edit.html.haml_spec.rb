require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/edit.html.erb" do
  include AddressesHelper

  before(:each) do
    assigns[:address] = @address = stub_model(Address,
      :new_record? => false,
      :street => "value for street",
      :complement => "value for complement",
      :number => "value for number",
      :zip_code => "value for zip_code"
    )
  end

  it "should render edit form" do
    render "/addresses/edit.html.erb"

    response.should have_tag("form[action=#{address_path(@address)}][method=post]") do
      with_tag('input#address_street[name=?]', "address[street]")
      with_tag('input#address_complement[name=?]', "address[complement]")
      with_tag('input#address_number[name=?]', "address[number]")
      with_tag('input#address_zip_code[name=?]', "address[zip_code]")
    end
  end
end


