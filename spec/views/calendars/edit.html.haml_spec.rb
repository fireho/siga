require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/calendars/edit.html.haml" do
  include CalendarsHelper

  before(:each) do
    assigns[:calendar] = @calendar = stub_model(Calendar,
      :new_record? => false,
      :business => false,
      :yearly => false,
      :note => "value for note"
    )
  end

  it "renders the edit calendar form" do
    render

    response.should have_tag("form[action=#{calendar_path(@calendar)}][method=post]") do
      with_tag('input#calendar_business[name=?]', "calendar[business]")
      with_tag('input#calendar_yearly[name=?]', "calendar[yearly]")
      with_tag('textarea#calendar_note[name=?]', "calendar[note]")
    end
  end
end


