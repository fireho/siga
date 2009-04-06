require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProfessionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "professions", :action => "index").should == "/professions"
    end
  
    it "maps #new" do
      route_for(:controller => "professions", :action => "new").should == "/professions/new"
    end
  
    it "maps #show" do
      route_for(:controller => "professions", :action => "show", :id => "1").should == "/professions/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "professions", :action => "edit", :id => "1").should == "/professions/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "professions", :action => "create").should == {:path => "/professions", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "professions", :action => "update", :id => "1").should == {:path =>"/professions/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "professions", :action => "destroy", :id => "1").should == {:path =>"/professions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/professions").should == {:controller => "professions", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/professions/new").should == {:controller => "professions", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/professions").should == {:controller => "professions", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/professions/1").should == {:controller => "professions", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/professions/1/edit").should == {:controller => "professions", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/professions/1").should == {:controller => "professions", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/professions/1").should == {:controller => "professions", :action => "destroy", :id => "1"}
    end
  end
end
