require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calendars/new.html.erb" do
  include CalendarsHelper
  
  before(:each) do
    assigns[:calendar] = stub_model(Calendar,
      :new_record? => true,
      :business => false,
      :yearly => false,
      :note => "value for note"
    )
  end

  it "renders new calendar form" do
    render
    
    response.should have_tag("form[action=?][method=post]", calendars_path) do
      with_tag("input#calendar_business[name=?]", "calendar[business]")
      with_tag("input#calendar_yearly[name=?]", "calendar[yearly]")
      with_tag("textarea#calendar_note[name=?]", "calendar[note]")
    end
  end
end


