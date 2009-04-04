require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contacts/new.html.erb" do
  include ContactsHelper

  before(:each) do
    assigns[:contact] = stub_model(Contact,
      :new_record? => true,
      :kind => "value for kind",
      :value => "value for value",
      :info => "value for info"
    )
  end

  it "should render new form" do
    render "/contacts/new.html.erb"

    response.should have_tag("form[action=?][method=post]", contacts_path) do
      with_tag("input#contact_kind[name=?]", "contact[kind]")
      with_tag("input#contact_value[name=?]", "contact[value]")
      with_tag("input#contact_info[name=?]", "contact[info]")
    end
  end
end


