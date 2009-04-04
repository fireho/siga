require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicationsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "publications", :action => "index").should == "/publications"
    end
  
    it "should map #new" do
      route_for(:controller => "publications", :action => "new").should == "/publications/new"
    end
  
    it "should map #show" do
      route_for(:controller => "publications", :action => "show", :id => 1).should == "/publications/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "publications", :action => "edit", :id => 1).should == "/publications/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "publications", :action => "update", :id => 1).should == "/publications/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "publications", :action => "destroy", :id => 1).should == "/publications/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/publications").should == {:controller => "publications", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/publications/new").should == {:controller => "publications", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/publications").should == {:controller => "publications", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/publications/1").should == {:controller => "publications", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/publications/1/edit").should == {:controller => "publications", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/publications/1").should == {:controller => "publications", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/publications/1").should == {:controller => "publications", :action => "destroy", :id => "1"}
    end
  end
end
