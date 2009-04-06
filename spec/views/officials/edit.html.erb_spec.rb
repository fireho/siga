require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/officials/edit.html.erb" do
  include OfficialsHelper
  
  before(:each) do
    assigns[:official] = @official = stub_model(Official,
      :new_record? => false,
      :post => "value for post"
    )
  end

  it "renders the edit official form" do
    render
    
    response.should have_tag("form[action=#{official_path(@official)}][method=post]") do
      with_tag('input#official_post[name=?]', "official[post]")
    end
  end
end


