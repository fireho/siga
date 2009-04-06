require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/animals/edit.html.erb" do
  include AnimalsHelper
  
  before(:each) do
    assigns[:animal] = @animal = stub_model(Animal,
      :new_record? => false,
      :name => "value for name",
      :age => 1,
      :sex => false,
      :kind => "value for kind",
      :fur => "value for fur",
      :race => "value for race"
    )
  end

  it "renders the edit animal form" do
    render
    
    response.should have_tag("form[action=#{animal_path(@animal)}][method=post]") do
      with_tag('input#animal_name[name=?]', "animal[name]")
      with_tag('input#animal_age[name=?]', "animal[age]")
      with_tag('input#animal_sex[name=?]', "animal[sex]")
      with_tag('input#animal_kind[name=?]', "animal[kind]")
      with_tag('input#animal_fur[name=?]', "animal[fur]")
      with_tag('input#animal_race[name=?]', "animal[race]")
    end
  end
end


