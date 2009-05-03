require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/families/edit.html.haml" do
  include FamiliesHelper

  before(:each) do
    assigns[:family] = @family = stub_model(Family,
      :new_record? => false,
      :name => "value for name",
      :people_count => 1,
      :revenue_cents => 1,
      :kind => "value for kind",
      :state => "value for state"
    )
  end

  it "renders the edit family form" do
    render

    response.should have_tag("form[action=#{family_path(@family)}][method=post]") do
      with_tag('input#family_name[name=?]', "family[name]")
      with_tag('input#family_revenue[name=?]', "family[revenue]")
      with_tag('select#family_kind[name=?]', "family[kind]")
      with_tag('select#family_state[name=?]', "family[state]")
    end
  end
end


