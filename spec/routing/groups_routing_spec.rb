require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GroupsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "groups", :action => "index").should == "/groups"
    end
  
    it "maps #new" do
      route_for(:controller => "groups", :action => "new").should == "/groups/new"
    end
  
    it "maps #show" do
      route_for(:controller => "groups", :action => "show", :id => "1").should == "/groups/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "groups", :action => "edit", :id => "1").should == "/groups/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "groups", :action => "create").should == {:path => "/groups", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "groups", :action => "update", :id => "1").should == {:path =>"/groups/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "groups", :action => "destroy", :id => "1").should == {:path =>"/groups/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/groups").should == {:controller => "groups", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/groups/new").should == {:controller => "groups", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/groups").should == {:controller => "groups", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/groups/1").should == {:controller => "groups", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/groups/1/edit").should == {:controller => "groups", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/groups/1").should == {:controller => "groups", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/groups/1").should == {:controller => "groups", :action => "destroy", :id => "1"}
    end
  end
end
