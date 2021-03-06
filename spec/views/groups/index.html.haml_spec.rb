require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/groups/index.html.haml" do
  include GroupsHelper

  before(:each) do
    assigns[:groups] = @g = [
      stub_model(Group,
        :name => "value for name",
        :official_name => "value for official_name",
        :kind => "value for kind"
      ),
      stub_model(Group,
        :name => "value for name",
        :official_name => "value for official_name",
        :kind => "value for kind"
      )
                       ]
    @g.should_receive(:total_pages).and_return(1)
  end

  it "renders a list of groups" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for official_name".to_s, 2)
    # response.should have_tag("tr>td", "value for kind".to_s, 2)
  end
end

