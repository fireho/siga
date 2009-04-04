require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/documents/edit.html.erb" do
  include DocumentsHelper
  
  before(:each) do
    assigns[:document] = @document = stub_model(Document,
      :new_record? => false,
      :kind => "value for kind",
      :value => "value for value",
      :note => "value for note",
      :state => "value for state"
    )
  end

  it "renders the edit document form" do
    render
    
    response.should have_tag("form[action=#{document_path(@document)}][method=post]") do
      with_tag('input#document_kind[name=?]', "document[kind]")
      with_tag('input#document_value[name=?]', "document[value]")
      with_tag('input#document_note[name=?]', "document[note]")
      with_tag('input#document_state[name=?]', "document[state]")
    end
  end
end


