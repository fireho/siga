require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/procurements/edit.html.haml" do
  include ProcurementsHelper

  before(:each) do
    assigns[:procurement] = @procurement = stub_model(Procurement,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "renders the edit procurement form" do
    render

    response.should have_tag("form[action=#{procurement_path(@procurement)}][method=post]") do
      with_tag('input#procurement_title[name=?]', "procurement[title]")
      with_tag('textarea#procurement_body[name=?]', "procurement[body]")
    end
  end
end


