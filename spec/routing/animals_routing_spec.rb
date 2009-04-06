require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AnimalsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "animals", :action => "index").should == "/animals"
    end
  
    it "maps #new" do
      route_for(:controller => "animals", :action => "new").should == "/animals/new"
    end
  
    it "maps #show" do
      route_for(:controller => "animals", :action => "show", :id => "1").should == "/animals/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "animals", :action => "edit", :id => "1").should == "/animals/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "animals", :action => "create").should == {:path => "/animals", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "animals", :action => "update", :id => "1").should == {:path =>"/animals/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "animals", :action => "destroy", :id => "1").should == {:path =>"/animals/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/animals").should == {:controller => "animals", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/animals/new").should == {:controller => "animals", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/animals").should == {:controller => "animals", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/animals/1").should == {:controller => "animals", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/animals/1/edit").should == {:controller => "animals", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/animals/1").should == {:controller => "animals", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/animals/1").should == {:controller => "animals", :action => "destroy", :id => "1"}
    end
  end
end
