require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HeritagesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "heritages", :action => "index").should == "/heritages"
    end
  
    it "maps #new" do
      route_for(:controller => "heritages", :action => "new").should == "/heritages/new"
    end
  
    it "maps #show" do
      route_for(:controller => "heritages", :action => "show", :id => "1").should == "/heritages/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "heritages", :action => "edit", :id => "1").should == "/heritages/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "heritages", :action => "create").should == {:path => "/heritages", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "heritages", :action => "update", :id => "1").should == {:path =>"/heritages/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "heritages", :action => "destroy", :id => "1").should == {:path =>"/heritages/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/heritages").should == {:controller => "heritages", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/heritages/new").should == {:controller => "heritages", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/heritages").should == {:controller => "heritages", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/heritages/1").should == {:controller => "heritages", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/heritages/1/edit").should == {:controller => "heritages", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/heritages/1").should == {:controller => "heritages", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/heritages/1").should == {:controller => "heritages", :action => "destroy", :id => "1"}
    end
  end
end
