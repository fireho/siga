require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "addresses", :action => "index").should == "/addresses"
    end

    it "should map #new" do
      route_for(:controller => "addresses", :action => "new").should == "/addresses/new"
    end

    it "should map #show" do
      route_for(:controller => "addresses", :action => "show", :id => "1").should == "/addresses/1"
    end

    it "should map #edit" do
      route_for(:controller => "addresses", :action => "edit", :id => "1").should == "/addresses/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "addresses", :action => "update", :id => "1").should == {:path =>"/addresses/1", :method => :put}
    end

    it "should map #destroy" do
      route_for(:controller => "addresses", :action => "destroy", :id => "1").should == {:path =>"/addresses/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/addresses").should == {:controller => "addresses", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/addresses/new").should == {:controller => "addresses", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/addresses").should == {:controller => "addresses", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/addresses/1").should == {:controller => "addresses", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/addresses/1/edit").should == {:controller => "addresses", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/addresses/1").should == {:controller => "addresses", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/addresses/1").should == {:controller => "addresses", :action => "destroy", :id => "1"}
    end
  end
end
