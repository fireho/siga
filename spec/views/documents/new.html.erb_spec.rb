require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/documents/new.html.erb" do
  include DocumentsHelper
  
  before(:each) do
    assigns[:document] = stub_model(Document,
      :new_record? => true,
      :kind => "value for kind",
      :value => "value for value",
      :note => "value for note",
      :state => "value for state"
    )
  end

  it "renders new document form" do
    render
    
    response.should have_tag("form[action=?][method=post]", documents_path) do
      with_tag("input#document_kind[name=?]", "document[kind]")
      with_tag("input#document_value[name=?]", "document[value]")
      with_tag("input#document_note[name=?]", "document[note]")
      with_tag("input#document_state[name=?]", "document[state]")
    end
  end
end


