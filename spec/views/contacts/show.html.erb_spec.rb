require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/show.html.erb" do
  include ContactsHelper
  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :kind => "value for kind",
      :value => "value for value",
      :info => "value for info"
    )
  end

  it "should render attributes in <p>" do
    render "/contacts/show.html.erb"
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ value/)
    response.should have_text(/value\ for\ info/)
  end
end

