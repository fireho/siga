require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LawsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "laws", :action => "index").should == "/laws"
    end
  
    it "maps #new" do
      route_for(:controller => "laws", :action => "new").should == "/laws/new"
    end
  
    it "maps #show" do
      route_for(:controller => "laws", :action => "show", :id => "1").should == "/laws/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "laws", :action => "edit", :id => "1").should == "/laws/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "laws", :action => "create").should == {:path => "/laws", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "laws", :action => "update", :id => "1").should == {:path =>"/laws/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "laws", :action => "destroy", :id => "1").should == {:path =>"/laws/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/laws").should == {:controller => "laws", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/laws/new").should == {:controller => "laws", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/laws").should == {:controller => "laws", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/laws/1").should == {:controller => "laws", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/laws/1/edit").should == {:controller => "laws", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/laws/1").should == {:controller => "laws", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/laws/1").should == {:controller => "laws", :action => "destroy", :id => "1"}
    end
  end
end
