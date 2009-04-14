require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/laws/new.html.haml" do
  include LawsHelper

  before(:each) do
    assigns[:law] = stub_model(Law,
      :new_record? => true,
      :content => "value for content"
    )
  end

  it "renders new law form" do
    render

    response.should have_tag("form[action=?][method=post]", laws_path) do
      with_tag("textarea#law_content[name=?]", "law[content]")
    end
  end
end


