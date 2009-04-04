require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "opts", :action => "index").should == "/opts"
    end

    it "maps #new" do
      route_for(:controller => "opts", :action => "new").should == "/opts/new"
    end

    it "maps #show" do
      route_for(:controller => "opts", :action => "show", :id => "1").should == "/opts/1"
    end

    it "maps #edit" do
      route_for(:controller => "opts", :action => "edit", :id => "1").should == "/opts/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "opts", :action => "create").should == {:path => "/opts", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "opts", :action => "update", :id => "1").should == {:path =>"/opts/1", :method => :put}
  end

    it "maps #destroy" do
      route_for(:controller => "opts", :action => "destroy", :id => "1").should == {:path =>"/opts/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/opts").should == {:controller => "opts", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/opts/new").should == {:controller => "opts", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/opts").should == {:controller => "opts", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/opts/1").should == {:controller => "opts", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/opts/1/edit").should == {:controller => "opts", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/opts/1").should == {:controller => "opts", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/opts/1").should == {:controller => "opts", :action => "destroy", :id => "1"}
    end
  end
end
