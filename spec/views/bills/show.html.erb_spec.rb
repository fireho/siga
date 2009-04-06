require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/bills/show.html.erb" do
  include BillsHelper
  before(:each) do
    assigns[:bill] = @bill = stub_model(Bill,
      :kind => "value for kind",
      :title => "value for title",
      :body => "value for body",
      :value_cents => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ body/)
    response.should have_text(/1/)
  end
end

