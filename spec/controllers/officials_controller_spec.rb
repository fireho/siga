require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OfficialsController do

  def mock_official(stubs={})
    @mock_official ||= mock_model(Official, stubs)
  end
  
  describe "GET index" do

    it "exposes all officials as @officials" do
      Official.should_receive(:find).with(:all).and_return([mock_official])
      get :index
      assigns[:officials].should == [mock_official]
    end

    describe "with mime type of xml" do
  
      it "renders all officials as xml" do
        Official.should_receive(:find).with(:all).and_return(officials = mock("Array of Officials"))
        officials.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested official as @official" do
      Official.should_receive(:find).with("37").and_return(mock_official)
      get :show, :id => "37"
      assigns[:official].should equal(mock_official)
    end
    
    describe "with mime type of xml" do

      it "renders the requested official as xml" do
        Official.should_receive(:find).with("37").and_return(mock_official)
        mock_official.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new official as @official" do
      Official.should_receive(:new).and_return(mock_official)
      get :new
      assigns[:official].should equal(mock_official)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested official as @official" do
      Official.should_receive(:find).with("37").and_return(mock_official)
      get :edit, :id => "37"
      assigns[:official].should equal(mock_official)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created official as @official" do
        Official.should_receive(:new).with({'these' => 'params'}).and_return(mock_official(:save => true))
        post :create, :official => {:these => 'params'}
        assigns(:official).should equal(mock_official)
      end

      it "redirects to the created official" do
        Official.stub!(:new).and_return(mock_official(:save => true))
        post :create, :official => {}
        response.should redirect_to(official_url(mock_official))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved official as @official" do
        Official.stub!(:new).with({'these' => 'params'}).and_return(mock_official(:save => false))
        post :create, :official => {:these => 'params'}
        assigns(:official).should equal(mock_official)
      end

      it "re-renders the 'new' template" do
        Official.stub!(:new).and_return(mock_official(:save => false))
        post :create, :official => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested official" do
        Official.should_receive(:find).with("37").and_return(mock_official)
        mock_official.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :official => {:these => 'params'}
      end

      it "exposes the requested official as @official" do
        Official.stub!(:find).and_return(mock_official(:update_attributes => true))
        put :update, :id => "1"
        assigns(:official).should equal(mock_official)
      end

      it "redirects to the official" do
        Official.stub!(:find).and_return(mock_official(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(official_url(mock_official))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested official" do
        Official.should_receive(:find).with("37").and_return(mock_official)
        mock_official.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :official => {:these => 'params'}
      end

      it "exposes the official as @official" do
        Official.stub!(:find).and_return(mock_official(:update_attributes => false))
        put :update, :id => "1"
        assigns(:official).should equal(mock_official)
      end

      it "re-renders the 'edit' template" do
        Official.stub!(:find).and_return(mock_official(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested official" do
      Official.should_receive(:find).with("37").and_return(mock_official)
      mock_official.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the officials list" do
      Official.stub!(:find).and_return(mock_official(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(officials_url)
    end

  end

end
