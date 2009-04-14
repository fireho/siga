require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitiesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "cities", :action => "index").should == "/cities"
    end

    it "should map #new" do
      route_for(:controller => "cities", :action => "new").should == "/cities/new"
    end

    it "should map #show" do
      route_for(:controller => "cities", :action => "show", :id => "1").should == "/cities/1"
    end

    it "should map #edit" do
      route_for(:controller => "cities", :action => "edit", :id => "1").should == "/cities/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "cities", :action => "update", :id => "1").should == {:path => "/cities/1",  :method => :put }
    end

    it "should map #destroy" do
      route_for(:controller => "cities", :action => "destroy", :id => "1").should == {:path => "/cities/1",  :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/cities").should == {:controller => "cities", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/cities/new").should == {:controller => "cities", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/cities").should == {:controller => "cities", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/cities/1").should == {:controller => "cities", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/cities/1/edit").should == {:controller => "cities", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/cities/1").should == {:controller => "cities", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/cities/1").should == {:controller => "cities", :action => "destroy", :id => "1"}
    end
  end
end
