require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/laws/edit.html.haml" do
  include LawsHelper

  before(:each) do
    assigns[:law] = @law = stub_model(Law,
      :new_record? => false,
      :content => "value for content"
    )
  end

  it "renders the edit law form" do
    render

    response.should have_tag("form[action=#{law_path(@law)}][method=post]") do
      with_tag('textarea#law_content[name=?]', "law[content]")
    end
  end
end


