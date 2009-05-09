require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MediasController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "medias", :action => "index").should == "/medias"
    end

    it "should map #new" do
      route_for(:controller => "medias", :action => "new").should == "/medias/new"
    end

    it "should map #show" do
      route_for(:controller => "medias", :action => "show", :id => "1").should == "/medias/1"
    end

    it "should map #edit" do
      route_for(:controller => "medias", :action => "edit", :id => "1").should == "/medias/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "medias", :action => "update", :id => "1").should == {:path => "/medias/1", :method => :put }
    end

    it "should map #destroy" do
      route_for(:controller => "medias", :action => "destroy", :id => "1").should == {:path => "/medias/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/medias").should == {:controller => "medias", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/medias/new").should == {:controller => "medias", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/medias").should == {:controller => "medias", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/medias/1").should == {:controller => "medias", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/medias/1/edit").should == {:controller => "medias", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/medias/1").should == {:controller => "medias", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/medias/1").should == {:controller => "medias", :action => "destroy", :id => "1"}
    end
  end
end
