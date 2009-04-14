require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ZonesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "zones", :action => "index").should == "/zones"
    end
  
    it "should map #new" do
      route_for(:controller => "zones", :action => "new").should == "/zones/new"
    end
  
    it "should map #show" do
      route_for(:controller => "zones", :action => "show", :id => 1).should == "/zones/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "zones", :action => "edit", :id => 1).should == "/zones/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "zones", :action => "update", :id => 1).should == "/zones/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "zones", :action => "destroy", :id => 1).should == "/zones/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/zones").should == {:controller => "zones", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/zones/new").should == {:controller => "zones", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/zones").should == {:controller => "zones", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/zones/1").should == {:controller => "zones", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/zones/1/edit").should == {:controller => "zones", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/zones/1").should == {:controller => "zones", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/zones/1").should == {:controller => "zones", :action => "destroy", :id => "1"}
    end
  end
end
