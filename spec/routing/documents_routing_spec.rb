require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DocumentsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "documents", :action => "index").should == "/documents"
    end
  
    it "maps #new" do
      route_for(:controller => "documents", :action => "new").should == "/documents/new"
    end
  
    it "maps #show" do
      route_for(:controller => "documents", :action => "show", :id => "1").should == "/documents/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "documents", :action => "edit", :id => "1").should == "/documents/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "documents", :action => "create").should == {:path => "/documents", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "documents", :action => "update", :id => "1").should == {:path =>"/documents/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "documents", :action => "destroy", :id => "1").should == {:path =>"/documents/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/documents").should == {:controller => "documents", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/documents/new").should == {:controller => "documents", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/documents").should == {:controller => "documents", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/documents/1").should == {:controller => "documents", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/documents/1/edit").should == {:controller => "documents", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/documents/1").should == {:controller => "documents", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/documents/1").should == {:controller => "documents", :action => "destroy", :id => "1"}
    end
  end
end
