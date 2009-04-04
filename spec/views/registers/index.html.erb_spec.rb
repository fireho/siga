require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/registers/index.html.erb" do
  include RegistersHelper
  
  before(:each) do
    assigns[:registers] = [
      stub_model(Register,
        :name => "value for name",
        :value_cents => 1,
        :sign => false
      ),
      stub_model(Register,
        :name => "value for name",
        :value_cents => 1,
        :sign => false
      )
    ]
  end

  it "renders a list of registers" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end

