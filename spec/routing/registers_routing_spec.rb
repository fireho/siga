require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RegistersController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "registers", :action => "index").should == "/registers"
    end
  
    it "maps #new" do
      route_for(:controller => "registers", :action => "new").should == "/registers/new"
    end
  
    it "maps #show" do
      route_for(:controller => "registers", :action => "show", :id => "1").should == "/registers/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "registers", :action => "edit", :id => "1").should == "/registers/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "registers", :action => "create").should == {:path => "/registers", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "registers", :action => "update", :id => "1").should == {:path =>"/registers/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "registers", :action => "destroy", :id => "1").should == {:path =>"/registers/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/registers").should == {:controller => "registers", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/registers/new").should == {:controller => "registers", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/registers").should == {:controller => "registers", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/registers/1").should == {:controller => "registers", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/registers/1/edit").should == {:controller => "registers", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/registers/1").should == {:controller => "registers", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/registers/1").should == {:controller => "registers", :action => "destroy", :id => "1"}
    end
  end
end
