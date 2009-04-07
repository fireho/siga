require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/index.html.haml" do
  include PeopleHelper

  before(:each) do
    assigns[:people] = @p = [
      stub_model(Person,
        :name => "value for name",
        :sex => "value for sex",
        :marital_status => "value for marital_status",
        :birthplace => "value for birthplace",
        :time_residence => "value for time_residence",
        :profession => "value for profession",
        :income => 1,
        :rooms => 1,
        :revenue => 1
      ),
      stub_model(Person,
        :name => "value for name",
        :sex => "value for sex",
        :marital_status => "value for marital_status",
        :birthplace => "value for birthplace",
        :time_residence => "value for time_residence",
        :profession => "value for profession",
        :income => 1,
        :room => 1,
        :revenue => 1,
        :habitantes => 1
      )
    ]
    @p.should_receive(:total_pages).and_return(1)

  end

  it "renders a list of people" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
#    response.should have_tag("tr>td", "value for sex".to_s, 2)
#    response.should have_tag("tr>td", "value for marital_status".to_s, 2)
#    response.should have_tag("tr>td", "value for birthplace".to_s, 2)
#    response.should have_tag("tr>td", "value for time_residence".to_s, 2)
#    response.should have_tag("tr>td", "value for profession".to_s, 2)
#    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

