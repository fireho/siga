require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/index.html.erb" do
  include AttachmentsHelper

  before(:each) do
    assigns[:attachments] = [
      stub_model(Attachment,
        :info => "value for info"
      ),
      stub_model(Attachment,
        :info => "value for info"
      )
    ]
  end

  it "should render list of attachments" do
    render "/attachments/index.html.erb"
    response.should have_tag("tr>td", "value for info".to_s, 2)
  end
end

