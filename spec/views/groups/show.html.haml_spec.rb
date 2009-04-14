require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/show.html.haml" do
  include GroupsHelper
  before(:each) do
    assigns[:group] = @group = stub_model(Group,
      :name => "value for name",
      :official_name => "value for official_name",
      :kind => "value for kind"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ official_name/)
    response.should have_text(/value\ for\ kind/)
  end
end

