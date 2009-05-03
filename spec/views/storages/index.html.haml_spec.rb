require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/storages/index.html.haml" do
  include StoragesHelper

  before(:each) do
    assigns[:storages] = @s =[
      stub_model(Storage,
        :amount => "value for amount",
        :unit => "value for unit",
        :value_cents => 1
      ),
      stub_model(Storage,
        :amount => "value for amount",
        :unit => "value for unit",
        :value_cents => 1
      )
    ]
    @s.should_receive(:total_pages).and_return(1)
  end

  it "renders a list of storages" do
    pending
    render
    response.should have_tag("tr>td", "value for amount".to_s, 2)
    response.should have_tag("tr>td", "value for unit".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

