require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/new.html.erb" do
  include AttachmentsHelper

  before(:each) do
    assigns[:attachment] = stub_model(Attachment,
      :new_record? => true,
      :info => "value for info"
    )
  end

  it "should render new form" do
    render "/attachments/new.html.erb"

    response.should have_tag("form[action=?][method=post]", attachments_path) do
      with_tag("textarea#attachment_info[name=?]", "attachment[info]")
    end
  end
end


