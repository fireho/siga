require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProvincesController do

  def mock_province(stubs={})
    @mock_province ||= mock_model(Province, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all provinces as @provinces" do
      Province.should_receive(:find).with(:all).and_return([mock_province])
      get :index
      assigns[:provinces].should == [mock_province]
    end

    describe "with mime type of xml" do
  
      it "should render all provinces as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Province.should_receive(:find).with(:all).and_return(provinces = mock("Array of Provinces"))
        provinces.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested province as @province" do
      Province.should_receive(:find).with("37").and_return(mock_province)
      get :show, :id => "37"
      assigns[:province].should equal(mock_province)
    end
    
    describe "with mime type of xml" do

      it "should render the requested province as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Province.should_receive(:find).with("37").and_return(mock_province)
        mock_province.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new province as @province" do
      Province.should_receive(:new).and_return(mock_province)
      get :new
      assigns[:province].should equal(mock_province)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested province as @province" do
      Province.should_receive(:find).with("37").and_return(mock_province)
      get :edit, :id => "37"
      assigns[:province].should equal(mock_province)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created province as @province" do
        Province.should_receive(:new).with({'these' => 'params'}).and_return(mock_province(:save => true))
        post :create, :province => {:these => 'params'}
        assigns(:province).should equal(mock_province)
      end

      it "should redirect to the created province" do
        Province.stub!(:new).and_return(mock_province(:save => true))
        post :create, :province => {}
        response.should redirect_to(province_url(mock_province))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved province as @province" do
        Province.stub!(:new).with({'these' => 'params'}).and_return(mock_province(:save => false))
        post :create, :province => {:these => 'params'}
        assigns(:province).should equal(mock_province)
      end

      it "should re-render the 'new' template" do
        Province.stub!(:new).and_return(mock_province(:save => false))
        post :create, :province => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested province" do
        Province.should_receive(:find).with("37").and_return(mock_province)
        mock_province.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :province => {:these => 'params'}
      end

      it "should expose the requested province as @province" do
        Province.stub!(:find).and_return(mock_province(:update_attributes => true))
        put :update, :id => "1"
        assigns(:province).should equal(mock_province)
      end

      it "should redirect to the province" do
        Province.stub!(:find).and_return(mock_province(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(province_url(mock_province))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested province" do
        Province.should_receive(:find).with("37").and_return(mock_province)
        mock_province.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :province => {:these => 'params'}
      end

      it "should expose the province as @province" do
        Province.stub!(:find).and_return(mock_province(:update_attributes => false))
        put :update, :id => "1"
        assigns(:province).should equal(mock_province)
      end

      it "should re-render the 'edit' template" do
        Province.stub!(:find).and_return(mock_province(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested province" do
      Province.should_receive(:find).with("37").and_return(mock_province)
      mock_province.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the provinces list" do
      Province.stub!(:find).and_return(mock_province(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(provinces_url)
    end

  end

end
