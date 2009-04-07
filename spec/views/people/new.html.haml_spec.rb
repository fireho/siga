require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/new.html.haml" do
  include PeopleHelper

  before(:each) do
    assigns[:person] = stub_model(Person,
      :new_record? => true,
      :name => "value for name",
      :sex => "value for sex",
      :marital_status => "value for marital_status",
      :birthplace => "value for birthplace",
      :time_residence => "value for time_residence",
      :profession => "value for profession",
      :room => 1,
      :revenue => 1,
      :habitantes => 1
    )
  end

  it "renders new person form" do
    render

    response.should have_tag("form[action=?][method=post]", people_path) do
      with_tag("input#person_name[name=?]", "person[name]")
#      with_tag("radio#person_sex[name=?]", "person[sex]")
#      with_tag("select#person_marital_status[name=?]", "person[marital_status]")
#      with_tag("input#person_birthplace[name=?]", "person[birthplace]")
#      with_tag("input#person_time_residence[name=?]", "person[time_residence]")
      with_tag("input#person_profession[name=?]", "person[profession]")
      with_tag("input#person_revenue[name=?]", "person[revenue]")
    end
  end
end


