require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/medias/index.html.erb" do
  include MediasHelper

  before(:each) do
    assigns[:medias] = [
      stub_model(Media,
        :info => "value for info"
      ),
      stub_model(Media,
        :info => "value for info"
      )
    ]
  end

  it "should render list of medias" do
    render "/medias/index.html.erb"
    response.should have_tag("tr>td", "value for info".to_s, 2)
  end
end

