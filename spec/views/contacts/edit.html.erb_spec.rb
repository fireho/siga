require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/edit.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contact] = @contact = stub_model(Contact,
      :new_record? => false,
      :kind => "value for kind",
      :value => "value for value",
      :info => "value for info"
    )
  end

  it "should render edit form" do
    render "/contacts/edit.html.erb"

    response.should have_tag("form[action=#{contact_path(@contact)}][method=post]") do
      with_tag('input#contact_kind[name=?]', "contact[kind]")
      with_tag('input#contact_value[name=?]', "contact[value]")
      with_tag('input#contact_info[name=?]', "contact[info]")
    end
  end
end


