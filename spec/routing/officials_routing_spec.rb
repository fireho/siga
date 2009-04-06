require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OfficialsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "officials", :action => "index").should == "/officials"
    end
  
    it "maps #new" do
      route_for(:controller => "officials", :action => "new").should == "/officials/new"
    end
  
    it "maps #show" do
      route_for(:controller => "officials", :action => "show", :id => "1").should == "/officials/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "officials", :action => "edit", :id => "1").should == "/officials/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "officials", :action => "create").should == {:path => "/officials", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "officials", :action => "update", :id => "1").should == {:path =>"/officials/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "officials", :action => "destroy", :id => "1").should == {:path =>"/officials/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/officials").should == {:controller => "officials", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/officials/new").should == {:controller => "officials", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/officials").should == {:controller => "officials", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/officials/1").should == {:controller => "officials", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/officials/1/edit").should == {:controller => "officials", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/officials/1").should == {:controller => "officials", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/officials/1").should == {:controller => "officials", :action => "destroy", :id => "1"}
    end
  end
end
