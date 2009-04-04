require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AreasController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "areas", :action => "index").should == "/areas"
    end
  
    it "maps #new" do
      route_for(:controller => "areas", :action => "new").should == "/areas/new"
    end
  
    it "maps #show" do
      route_for(:controller => "areas", :action => "show", :id => "1").should == "/areas/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "areas", :action => "edit", :id => "1").should == "/areas/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "areas", :action => "create").should == {:path => "/areas", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "areas", :action => "update", :id => "1").should == {:path =>"/areas/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "areas", :action => "destroy", :id => "1").should == {:path =>"/areas/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/areas").should == {:controller => "areas", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/areas/new").should == {:controller => "areas", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/areas").should == {:controller => "areas", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/areas/1").should == {:controller => "areas", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/areas/1/edit").should == {:controller => "areas", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/areas/1").should == {:controller => "areas", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/areas/1").should == {:controller => "areas", :action => "destroy", :id => "1"}
    end
  end
end
