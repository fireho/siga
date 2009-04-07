require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/show.html.haml" do
  include PeopleHelper
  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :name => "value for name",
      :sex => "value for sex",
      :marital_status => "value for marital_status",
#      :birthplace => "value for birthplace",
      :time_residence => "value for time_residence",
      :profession => "value for profession",
      :income => 1,
      :rooms => 1,
      :revenue => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
#    response.should have_text(/value\ for\ sex/)
#    response.should have_text(/value\ for\ birthplace/)
    response.should have_text(/Feminino/)
    response.should have_text(/value\ for\ profession/)
    response.should have_text(/1/)
  end
end

