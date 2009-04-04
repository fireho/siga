require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/publications/new.html.erb" do
  include PublicationsHelper
  
  before(:each) do
    assigns[:publication] = stub_model(Publication,
      :new_record? => true,
      :title => "value for title",
      :body => "value for body"
    )
  end

  it "should render new form" do
    render "/publications/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", publications_path) do
      with_tag("input#publication_title[name=?]", "publication[title]")
      with_tag("textarea#publication_body[name=?]", "publication[body]")
    end
  end
end


