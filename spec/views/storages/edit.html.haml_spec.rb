require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/storages/edit.html.haml" do
  include StoragesHelper

  before(:each) do
    assigns[:storage] = @storage = stub_model(Storage,
      :new_record? => false,
      :amount => "value for amount",
      :unit => "value for unit",
      :value_cents => 1
    )
  end

  it "renders the edit storage form" do
    render

    response.should have_tag("form[action=#{storage_path(@storage)}][method=post]") do
      with_tag('input#storage_amount[name=?]', "storage[amount]")
      with_tag('input#storage_unit[name=?]', "storage[unit]")
      with_tag('input#storage_value_cents[name=?]', "storage[value_cents]")
    end
  end
end


