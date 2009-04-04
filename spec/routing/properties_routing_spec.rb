require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PropertiesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "properties", :action => "index").should == "/properties"
    end
  
    it "maps #new" do
      route_for(:controller => "properties", :action => "new").should == "/properties/new"
    end
  
    it "maps #show" do
      route_for(:controller => "properties", :action => "show", :id => "1").should == "/properties/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "properties", :action => "edit", :id => "1").should == "/properties/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "properties", :action => "create").should == {:path => "/properties", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "properties", :action => "update", :id => "1").should == {:path =>"/properties/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "properties", :action => "destroy", :id => "1").should == {:path =>"/properties/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/properties").should == {:controller => "properties", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/properties/new").should == {:controller => "properties", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/properties").should == {:controller => "properties", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/properties/1").should == {:controller => "properties", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/properties/1/edit").should == {:controller => "properties", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/properties/1").should == {:controller => "properties", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/properties/1").should == {:controller => "properties", :action => "destroy", :id => "1"}
    end
  end
end
