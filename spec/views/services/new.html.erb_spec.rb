require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/new.html.erb" do
  include ServicesHelper
  
  before(:each) do
    assigns[:service] = stub_model(Service,
      :new_record? => true,
      :name => "value for name",
      :kind => "value for kind",
      :value_cents => 1,
      :done => false
    )
  end

  it "renders new service form" do
    render
    
    response.should have_tag("form[action=?][method=post]", services_path) do
      with_tag("input#service_name[name=?]", "service[name]")
      with_tag("input#service_kind[name=?]", "service[kind]")
      with_tag("input#service_value_cents[name=?]", "service[value_cents]")
      with_tag("input#service_done[name=?]", "service[done]")
    end
  end
end


