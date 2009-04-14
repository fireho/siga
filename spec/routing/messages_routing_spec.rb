require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "messages", :action => "index").should == "/messages"
    end

    it "should map #new" do
      route_for(:controller => "messages", :action => "new").should == "/messages/new"
    end

    it "should map #new" do
      route_for(:controller => "messages", :action => "new", :id => "nofxx").should == "/inbox/new/nofxx"
    end

    it "should map #show" do
      route_for(:controller => "messages", :action => "show", :id => "1").should == "/messages/1"
    end

    it "should map #edit" do
      route_for(:controller => "messages", :action => "edit", :id => "1").should == "/messages/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "messages", :action => "update", :id => "1").should == {:path => "/messages/1", :method => :put }
    end

    it "should map #destroy" do
      route_for(:controller => "messages", :action => "destroy", :id => "1").should == {:path => "/messages/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/messages").should == {:controller => "messages", :action => "index"}
    end

    it "should generate params for #inbox" do
      params_from(:get, "/inbox").should == {:controller => "messages", :action => "index"}
    end

    it "should generate params for #inbox new" do
      params_from(:get, "/inbox/new/nofxx").should == {:controller => "messages", :action => "new", :id => "nofxx"}
    end

    it "should generate params for #new" do
      params_from(:get, "/messages/new").should == {:controller => "messages", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/messages").should == {:controller => "messages", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/messages/1").should == {:controller => "messages", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/messages/1/edit").should == {:controller => "messages", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/messages/1").should == {:controller => "messages", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/messages/1").should == {:controller => "messages", :action => "destroy", :id => "1"}
    end
  end
end
