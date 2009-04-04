require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/edit.html.erb" do
  include AttachmentsHelper

  before(:each) do
    assigns[:attachment] = @attachment = stub_model(Attachment,
      :new_record? => false,
      :info => "value for info"
    )
  end

  it "should render edit form" do
    render "/attachments/edit.html.erb"

    response.should have_tag("form[action=#{attachment_path(@attachment)}][method=post]") do
      with_tag('textarea#attachment_info[name=?]', "attachment[info]")
    end
  end
end


