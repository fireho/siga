require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/provinces/index.html.erb" do
  include ProvincesHelper
  
  before(:each) do
    assigns[:provinces] = [
      stub_model(Province,
        :name => "value for name",
        :pop => 1
      ),
      stub_model(Province,
        :name => "value for name",
        :pop => 1
      )
    ]
  end

  it "should render list of provinces" do
    render "/provinces/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

