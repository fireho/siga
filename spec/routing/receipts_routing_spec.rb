require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReceiptsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "receipts", :action => "index").should == "/receipts"
    end
  
    it "maps #new" do
      route_for(:controller => "receipts", :action => "new").should == "/receipts/new"
    end
  
    it "maps #show" do
      route_for(:controller => "receipts", :action => "show", :id => "1").should == "/receipts/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "receipts", :action => "edit", :id => "1").should == "/receipts/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "receipts", :action => "create").should == {:path => "/receipts", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "receipts", :action => "update", :id => "1").should == {:path =>"/receipts/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "receipts", :action => "destroy", :id => "1").should == {:path =>"/receipts/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/receipts").should == {:controller => "receipts", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/receipts/new").should == {:controller => "receipts", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/receipts").should == {:controller => "receipts", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/receipts/1").should == {:controller => "receipts", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/receipts/1/edit").should == {:controller => "receipts", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/receipts/1").should == {:controller => "receipts", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/receipts/1").should == {:controller => "receipts", :action => "destroy", :id => "1"}
    end
  end
end
