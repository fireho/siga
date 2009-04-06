require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ads/new.html.erb" do
  include AdsHelper
  
  before(:each) do
    assigns[:ad] = stub_model(Ad,
      :new_record? => true,
      :title => "value for title",
      :kind => "value for kind",
      :body => "value for body"
    )
  end

  it "renders new ad form" do
    render
    
    response.should have_tag("form[action=?][method=post]", ads_path) do
      with_tag("input#ad_title[name=?]", "ad[title]")
      with_tag("input#ad_kind[name=?]", "ad[kind]")
      with_tag("textarea#ad_body[name=?]", "ad[body]")
    end
  end
end


