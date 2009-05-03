require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/officials/new.html.haml" do
  include OfficialsHelper

  before(:each) do
    assigns[:official] = stub_model(Official,
      :new_record? => true,
      :post => "value for post"
    )
  end

  it "renders new official form" do
    render

    response.should have_tag("form[action=?][method=post]", officials_path) do
      with_tag("input#official_post[name=?]", "official[post]")
    end
  end
end


