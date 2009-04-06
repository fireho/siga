require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/receipts/edit.html.erb" do
  include ReceiptsHelper
  
  before(:each) do
    assigns[:receipt] = @receipt = stub_model(Receipt,
      :new_record? => false,
      :kind => "value for kind",
      :title => "value for title",
      :body => "value for body",
      :value_cents => 1
    )
  end

  it "renders the edit receipt form" do
    render
    
    response.should have_tag("form[action=#{receipt_path(@receipt)}][method=post]") do
      with_tag('input#receipt_kind[name=?]', "receipt[kind]")
      with_tag('input#receipt_title[name=?]', "receipt[title]")
      with_tag('textarea#receipt_body[name=?]', "receipt[body]")
      with_tag('input#receipt_value_cents[name=?]', "receipt[value_cents]")
    end
  end
end


