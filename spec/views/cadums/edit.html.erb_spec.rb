require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/people/edit.html.erb" do
  include PeopleHelper

  before(:each) do
    assigns[:person] = @person = stub_model(Person,
      :new_record? => false,
      :name => "value for name",
      :sex => "value for sex",
      :marital_status => "value for marital_status",
      :birthplace => "value for birthplace",
      :time_residence => "value for time_residence",
      :profession => "value for profession",
      :income => 1,
      :housing => "value for housing",
      :type_housing => "value for type_housing",
      :type_house => "value for type_house",
      :room => 1,
      :revenue => 1,
      :habitantes => 1
    )
  end

  it "renders the edit person form" do
    render

    response.should have_tag("form[action=#{person_path(@person)}][method=post]") do
      with_tag('input#person_name[name=?]', "person[name]")
      with_tag('input#person_sex[name=?]', "person[sex]")
      with_tag('input#person_marital_status[name=?]', "person[marital_status]")
      with_tag('input#person_birthplace[name=?]', "person[birthplace]")
      with_tag('input#person_time_residence[name=?]', "person[time_residence]")
      with_tag('input#person_profession[name=?]', "person[profession]")
      with_tag('input#person_income[name=?]', "person[income]")
      with_tag('input#person_housing[name=?]', "person[housing]")
      with_tag('input#person_type_housing[name=?]', "person[type_housing]")
      with_tag('input#person_type_house[name=?]', "person[type_house]")
      with_tag('input#person_room[name=?]', "person[room]")
      with_tag('input#person_revenue[name=?]', "person[revenue]")
      with_tag('input#person_habitantes[name=?]', "person[habitantes]")
    end
  end
end


