require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StoragesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "storages", :action => "index").should == "/storages"
    end
  
    it "maps #new" do
      route_for(:controller => "storages", :action => "new").should == "/storages/new"
    end
  
    it "maps #show" do
      route_for(:controller => "storages", :action => "show", :id => "1").should == "/storages/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "storages", :action => "edit", :id => "1").should == "/storages/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "storages", :action => "create").should == {:path => "/storages", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "storages", :action => "update", :id => "1").should == {:path =>"/storages/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "storages", :action => "destroy", :id => "1").should == {:path =>"/storages/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/storages").should == {:controller => "storages", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/storages/new").should == {:controller => "storages", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/storages").should == {:controller => "storages", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/storages/1").should == {:controller => "storages", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/storages/1/edit").should == {:controller => "storages", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/storages/1").should == {:controller => "storages", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/storages/1").should == {:controller => "storages", :action => "destroy", :id => "1"}
    end
  end
end
