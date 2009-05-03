require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/procurements/new.html.haml" do
  include ProcurementsHelper

  before(:each) do
    assigns[:procurement] = stub_model(Procurement,
      :new_record? => true,
      :title => "value for name",
      :body => "value for body"
    )
  end

  it "renders new procurement form" do
    render

    response.should have_tag("form[action=?][method=post]", procurements_path) do
      with_tag("input#procurement_title[name=?]", "procurement[title]")
      with_tag("textarea#procurement_body[name=?]", "procurement[body]")
    end
  end
end


