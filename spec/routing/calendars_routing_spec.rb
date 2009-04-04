require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CalendarsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "calendars", :action => "index").should == "/calendars"
    end
  
    it "maps #new" do
      route_for(:controller => "calendars", :action => "new").should == "/calendars/new"
    end
  
    it "maps #show" do
      route_for(:controller => "calendars", :action => "show", :id => "1").should == "/calendars/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "calendars", :action => "edit", :id => "1").should == "/calendars/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "calendars", :action => "create").should == {:path => "/calendars", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "calendars", :action => "update", :id => "1").should == {:path =>"/calendars/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "calendars", :action => "destroy", :id => "1").should == {:path =>"/calendars/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/calendars").should == {:controller => "calendars", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/calendars/new").should == {:controller => "calendars", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/calendars").should == {:controller => "calendars", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/calendars/1").should == {:controller => "calendars", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/calendars/1/edit").should == {:controller => "calendars", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/calendars/1").should == {:controller => "calendars", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/calendars/1").should == {:controller => "calendars", :action => "destroy", :id => "1"}
    end
  end
end
