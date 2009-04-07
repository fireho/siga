require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/index.html.haml" do
  include PublicationsHelper

  before(:each) do
    @controller.template.stub!(:current_user).and_return(true)
    assigns[:publications] = @pub = [
      stub_model(Publication,
        :title => "value for title",
        :body => "value for body",
        :created_at => Time.now

      ),
      stub_model(Publication,
        :title => "value for title",
        :body => "value for body",
        :created_at => Time.now
      )
                             ]
     @pub.should_receive(:total_pages).and_return(1)
  end

  it "should render list of publications" do
    render "/publications/index.html.haml"

    response.should have_text(/value\ for\ title/)

  end
end

