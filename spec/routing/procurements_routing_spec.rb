require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProcurementsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "procurements", :action => "index").should == "/procurements"
    end
  
    it "maps #new" do
      route_for(:controller => "procurements", :action => "new").should == "/procurements/new"
    end
  
    it "maps #show" do
      route_for(:controller => "procurements", :action => "show", :id => "1").should == "/procurements/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "procurements", :action => "edit", :id => "1").should == "/procurements/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "procurements", :action => "create").should == {:path => "/procurements", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "procurements", :action => "update", :id => "1").should == {:path =>"/procurements/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "procurements", :action => "destroy", :id => "1").should == {:path =>"/procurements/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/procurements").should == {:controller => "procurements", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/procurements/new").should == {:controller => "procurements", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/procurements").should == {:controller => "procurements", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/procurements/1").should == {:controller => "procurements", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/procurements/1/edit").should == {:controller => "procurements", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/procurements/1").should == {:controller => "procurements", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/procurements/1").should == {:controller => "procurements", :action => "destroy", :id => "1"}
    end
  end
end
