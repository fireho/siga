require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')


describe People do


  it "should return 200 ok" do
    get "/people.json"

    response.should be_ok
  end

end
