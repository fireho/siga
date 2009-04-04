require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calendars/show.html.erb" do
  include CalendarsHelper
  before(:each) do
    assigns[:calendar] = @calendar = stub_model(Calendar,
      :business => false,
      :yearly => false,
      :note => "value for note"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ note/)
  end
end

