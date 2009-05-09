require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/medias/new.html.erb" do
  include MediasHelper

  before(:each) do
    assigns[:media] = stub_model(Media,
      :new_record? => true,
      :info => "value for info"
    )
  end

  it "should render new form" do
    render "/medias/new.html.erb"

    response.should have_tag("form[action=?][method=post]", medias_path) do
      with_tag("textarea#media_info[name=?]", "media[info]")
    end
  end
end


