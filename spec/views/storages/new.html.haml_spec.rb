require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/storages/new.html.haml" do
  include StoragesHelper

  before(:each) do
    assigns[:storage] = stub_model(Storage,
      :new_record? => true,
      :amount => "value for amount",
      :unit => "value for unit",
      :value_cents => 1
    )
  end

  it "renders new storage form" do
    render

    response.should have_tag("form[action=?][method=post]", storages_path) do
      with_tag("input#storage_amount[name=?]", "storage[amount]")
      with_tag("input#storage_unit[name=?]", "storage[unit]")
      with_tag("input#storage_value_cents[name=?]", "storage[value_cents]")
    end
  end
end


