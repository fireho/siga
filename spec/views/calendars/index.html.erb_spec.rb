require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calendars/index.html.erb" do
  include CalendarsHelper
  
  before(:each) do
    assigns[:calendars] = [
      stub_model(Calendar,
        :business => false,
        :yearly => false,
        :note => "value for note"
      ),
      stub_model(Calendar,
        :business => false,
        :yearly => false,
        :note => "value for note"
      )
    ]
  end

  it "renders a list of calendars" do
    render
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for note".to_s, 2)
  end
end

