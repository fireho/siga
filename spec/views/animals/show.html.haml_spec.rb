require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/animals/show.html.erb" do
  include AnimalsHelper
  before(:each) do
    assigns[:animal] = @animal = stub_model(Animal,
      :name => "value for name",
      :age => 1,
      :sex => false,
      :kind => "value for kind",
      :fur => "value for fur",
      :race => "value for race"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/1/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ kind/)
    response.should have_text(/value\ for\ fur/)
    response.should have_text(/value\ for\ race/)
  end
end

