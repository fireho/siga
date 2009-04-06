require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FamiliesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "families", :action => "index").should == "/families"
    end
  
    it "maps #new" do
      route_for(:controller => "families", :action => "new").should == "/families/new"
    end
  
    it "maps #show" do
      route_for(:controller => "families", :action => "show", :id => "1").should == "/families/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "families", :action => "edit", :id => "1").should == "/families/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "families", :action => "create").should == {:path => "/families", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "families", :action => "update", :id => "1").should == {:path =>"/families/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "families", :action => "destroy", :id => "1").should == {:path =>"/families/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/families").should == {:controller => "families", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/families/new").should == {:controller => "families", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/families").should == {:controller => "families", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/families/1").should == {:controller => "families", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/families/1/edit").should == {:controller => "families", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/families/1").should == {:controller => "families", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/families/1").should == {:controller => "families", :action => "destroy", :id => "1"}
    end
  end
end
