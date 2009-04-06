require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BillsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "bills", :action => "index").should == "/bills"
    end
  
    it "maps #new" do
      route_for(:controller => "bills", :action => "new").should == "/bills/new"
    end
  
    it "maps #show" do
      route_for(:controller => "bills", :action => "show", :id => "1").should == "/bills/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "bills", :action => "edit", :id => "1").should == "/bills/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "bills", :action => "create").should == {:path => "/bills", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "bills", :action => "update", :id => "1").should == {:path =>"/bills/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "bills", :action => "destroy", :id => "1").should == {:path =>"/bills/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/bills").should == {:controller => "bills", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/bills/new").should == {:controller => "bills", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/bills").should == {:controller => "bills", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/bills/1").should == {:controller => "bills", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/bills/1/edit").should == {:controller => "bills", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/bills/1").should == {:controller => "bills", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/bills/1").should == {:controller => "bills", :action => "destroy", :id => "1"}
    end
  end
end
