require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/animals/index.html.erb" do
  include AnimalsHelper
  
  before(:each) do
    assigns[:animals] = [
      stub_model(Animal,
        :name => "value for name",
        :age => 1,
        :sex => false,
        :kind => "value for kind",
        :fur => "value for fur",
        :race => "value for race"
      ),
      stub_model(Animal,
        :name => "value for name",
        :age => 1,
        :sex => false,
        :kind => "value for kind",
        :fur => "value for fur",
        :race => "value for race"
      )
    ]
  end

  it "renders a list of animals" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for kind".to_s, 2)
    response.should have_tag("tr>td", "value for fur".to_s, 2)
    response.should have_tag("tr>td", "value for race".to_s, 2)
  end
end

