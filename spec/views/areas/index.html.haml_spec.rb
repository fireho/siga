require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/areas/index.html.haml" do
  include AreasHelper

  before(:each) do
    assigns[:areas] = @a = [
      stub_model(Area,
        :name => "value for name",
        :kind => "value for kind"
      ),
      stub_model(Area,
        :name => "value for name",
        :kind => "value for kind"
      )
    ]
    @a.should_receive(:total_pages).and_return(1)
  end

  it "renders a list of areas" do
    pending
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
  end
end

