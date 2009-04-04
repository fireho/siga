require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/charters/index.html.erb" do
  include ChartersHelper
  
  before(:each) do
    assigns[:charters] = [
      stub_model(Charter,
        :code => "value for code",
        :restrictions => "value for restrictions"
      ),
      stub_model(Charter,
        :code => "value for code",
        :restrictions => "value for restrictions"
      )
    ]
  end

  it "renders a list of charters" do
    render
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for restrictions".to_s, 2)
  end
end

