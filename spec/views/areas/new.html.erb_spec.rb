require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/areas/new.html.erb" do
  include AreasHelper

  before(:each) do
    assigns[:area] = stub_model(Area,
      :new_record? => true,
      :name => "value for name",
      :kind => "value for kind",
      :geom => mock("Geom")
    )
  end

  it "renders new area form" do
    render

    response.should have_tag("form[action=?][method=post]", areas_path) do
      with_tag("input#area_name[name=?]", "area[name]")
      with_tag("input#area_kind[name=?]", "area[kind]")
      with_tag("input#area_geom[name=?]", "area[geom]")
    end
  end
end


