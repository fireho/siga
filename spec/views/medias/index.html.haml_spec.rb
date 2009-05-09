require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/medias/index.html.haml" do
  include MediasHelper

  before(:each) do
    assigns[:medias] = @m = [
      stub_model(Media,
        :info => "value for info"
      ),
      stub_model(Media,
        :info => "value for info"
      )
    ]
    @m.should_receive(:total_pages).and_return(1)
  end

  it "should render list of medias" do
    render "/medias/index.html.haml"
    response.should have_tag("tr>td", "value for info".to_s, 2)
  end
end

