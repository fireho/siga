require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "admin", :action => "index").should == "/admin"
    end

  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/admin").should == {:controller => "admin", :action => "index"}
    end

  end
end
