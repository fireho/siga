require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "ads", :action => "index").should == "/ads"
    end
  
    it "maps #new" do
      route_for(:controller => "ads", :action => "new").should == "/ads/new"
    end
  
    it "maps #show" do
      route_for(:controller => "ads", :action => "show", :id => "1").should == "/ads/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "ads", :action => "edit", :id => "1").should == "/ads/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "ads", :action => "create").should == {:path => "/ads", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "ads", :action => "update", :id => "1").should == {:path =>"/ads/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "ads", :action => "destroy", :id => "1").should == {:path =>"/ads/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/ads").should == {:controller => "ads", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/ads/new").should == {:controller => "ads", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/ads").should == {:controller => "ads", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/ads/1").should == {:controller => "ads", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/ads/1/edit").should == {:controller => "ads", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/ads/1").should == {:controller => "ads", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/ads/1").should == {:controller => "ads", :action => "destroy", :id => "1"}
    end
  end
end
