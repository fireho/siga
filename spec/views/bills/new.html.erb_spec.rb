require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bills/new.html.erb" do
  include BillsHelper
  
  before(:each) do
    assigns[:bill] = stub_model(Bill,
      :new_record? => true,
      :kind => "value for kind",
      :title => "value for title",
      :body => "value for body",
      :value_cents => 1
    )
  end

  it "renders new bill form" do
    render
    
    response.should have_tag("form[action=?][method=post]", bills_path) do
      with_tag("input#bill_kind[name=?]", "bill[kind]")
      with_tag("input#bill_title[name=?]", "bill[title]")
      with_tag("textarea#bill_body[name=?]", "bill[body]")
      with_tag("input#bill_value_cents[name=?]", "bill[value_cents]")
    end
  end
end


