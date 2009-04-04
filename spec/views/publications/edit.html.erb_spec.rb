require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/edit.html.erb" do
  include PublicationsHelper
  
  before(:each) do
    assigns[:publication] = @publication = stub_model(Publication,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "should render edit form" do
    render "/publications/edit.html.erb"
    
    response.should have_tag("form[action=#{publication_path(@publication)}][method=post]") do
      with_tag('input#publication_title[name=?]', "publication[title]")
      with_tag('textarea#publication_body[name=?]', "publication[body]")
    end
  end
end


