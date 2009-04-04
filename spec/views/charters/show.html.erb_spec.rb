require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/charters/show.html.erb" do
  include ChartersHelper
  before(:each) do
    assigns[:charter] = @charter = stub_model(Charter,
      :code => "value for code",
      :restrictions => "value for restrictions"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ restrictions/)
  end
end

