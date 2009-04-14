require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CountriesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "countries", :action => "index").should == "/countries"
    end

    it "should map #new" do
      route_for(:controller => "countries", :action => "new").should == "/countries/new"
    end

    it "should map #show" do
      route_for(:controller => "countries", :action => "show", :id => "1").should == "/countries/1"
    end

    it "should map #edit" do
      route_for(:controller => "countries", :action => "edit", :id => "1").should == "/countries/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "countries", :action => "update", :id => "1").should == {:path => "/countries/1",  :method => :put }
    end

    it "should map #destroy" do
      route_for(:controller => "countries", :action => "destroy", :id => "1").should == {:path => "/countries/1",  :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/countries").should == {:controller => "countries", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/countries/new").should == {:controller => "countries", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/countries").should == {:controller => "countries", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/countries/1").should == {:controller => "countries", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/countries/1/edit").should == {:controller => "countries", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/countries/1").should == {:controller => "countries", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/countries/1").should == {:controller => "countries", :action => "destroy", :id => "1"}
    end
  end
end
