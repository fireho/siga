require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChartersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "charters", :action => "index").should == "/charters"
    end
  
    it "maps #new" do
      route_for(:controller => "charters", :action => "new").should == "/charters/new"
    end
  
    it "maps #show" do
      route_for(:controller => "charters", :action => "show", :id => "1").should == "/charters/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "charters", :action => "edit", :id => "1").should == "/charters/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "charters", :action => "create").should == {:path => "/charters", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "charters", :action => "update", :id => "1").should == {:path =>"/charters/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "charters", :action => "destroy", :id => "1").should == {:path =>"/charters/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/charters").should == {:controller => "charters", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/charters/new").should == {:controller => "charters", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/charters").should == {:controller => "charters", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/charters/1").should == {:controller => "charters", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/charters/1/edit").should == {:controller => "charters", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/charters/1").should == {:controller => "charters", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/charters/1").should == {:controller => "charters", :action => "destroy", :id => "1"}
    end
  end
end
