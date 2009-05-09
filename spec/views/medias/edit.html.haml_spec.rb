require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/medias/edit.html.haml" do
  include MediasHelper

  before(:each) do
    assigns[:media] = @media = stub_model(Media,
      :new_record? => false,
      :info => "value for info"
    )
  end

  it "should render edit form" do
    render "/medias/edit.html.haml"

    response.should have_tag("form[action=#{media_path(@media)}][method=post]") do
      with_tag('textarea#media_info[name=?]', "media[info]")
    end
  end
end


