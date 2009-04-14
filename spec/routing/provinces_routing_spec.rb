require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProvincesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "provinces", :action => "index").should == "/provinces"
    end

    it "should map #new" do
      route_for(:controller => "provinces", :action => "new").should == "/provinces/new"
    end

    it "should map #show" do
      route_for(:controller => "provinces", :action => "show", :id => "1").should == "/provinces/1"
    end

    it "should map #edit" do
      route_for(:controller => "provinces", :action => "edit", :id => "1").should == "/provinces/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "provinces", :action => "update", :id => "1").should == {:path => "/provinces/1", :method => :put }
    end

    it "should map #destroy" do
      route_for(:controller => "provinces", :action => "destroy", :id => "1").should == {:path => "/provinces/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/provinces").should == {:controller => "provinces", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/provinces/new").should == {:controller => "provinces", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/provinces").should == {:controller => "provinces", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/provinces/1").should == {:controller => "provinces", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/provinces/1/edit").should == {:controller => "provinces", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/provinces/1").should == {:controller => "provinces", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/provinces/1").should == {:controller => "provinces", :action => "destroy", :id => "1"}
    end
  end
end
