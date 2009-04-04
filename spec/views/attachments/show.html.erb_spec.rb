require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/attachments/show.html.erb" do
  include AttachmentsHelper
  before(:each) do
    assigns[:attachment] = @attachment = stub_model(Attachment,
      :info => "value for info"
    )
  end

  it "should render attributes in <p>" do
    render "/attachments/show.html.erb"
    response.should have_text(/value\ for\ info/)
  end
end

