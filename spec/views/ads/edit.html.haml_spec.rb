require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/ads/edit.html.haml" do
  include AdsHelper

  before(:each) do
    assigns[:ad] = @ad = stub_model(Ad,
      :new_record? => false,
      :title => "value for title",
      :kind => "value for kind",
      :body => "value for body"
    )
  end

  it "renders the edit ad form" do
    render

    response.should have_tag("form[action=#{ad_path(@ad)}][method=post]") do
      with_tag('input#ad_title[name=?]', "ad[title]")
      with_tag('input#ad_kind[name=?]', "ad[kind]")
      with_tag('textarea#ad_body[name=?]', "ad[body]")
    end
  end
end


