require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ZonesController do

  def mock_zone(stubs={})
    @mock_zone ||= mock_model(Zone, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all zones as @zones" do
      Zone.should_receive(:find).with(:all).and_return([mock_zone])
      get :index
      assigns[:zones].should == [mock_zone]
    end

    describe "with mime type of xml" do
  
      it "should render all zones as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Zone.should_receive(:find).with(:all).and_return(zones = mock("Array of Zones"))
        zones.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested zone as @zone" do
      Zone.should_receive(:find).with("37").and_return(mock_zone)
      get :show, :id => "37"
      assigns[:zone].should equal(mock_zone)
    end
    
    describe "with mime type of xml" do

      it "should render the requested zone as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Zone.should_receive(:find).with("37").and_return(mock_zone)
        mock_zone.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new zone as @zone" do
      Zone.should_receive(:new).and_return(mock_zone)
      get :new
      assigns[:zone].should equal(mock_zone)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested zone as @zone" do
      Zone.should_receive(:find).with("37").and_return(mock_zone)
      get :edit, :id => "37"
      assigns[:zone].should equal(mock_zone)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created zone as @zone" do
        Zone.should_receive(:new).with({'these' => 'params'}).and_return(mock_zone(:save => true))
        post :create, :zone => {:these => 'params'}
        assigns(:zone).should equal(mock_zone)
      end

      it "should redirect to the created zone" do
        Zone.stub!(:new).and_return(mock_zone(:save => true))
        post :create, :zone => {}
        response.should redirect_to(zone_url(mock_zone))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved zone as @zone" do
        Zone.stub!(:new).with({'these' => 'params'}).and_return(mock_zone(:save => false))
        post :create, :zone => {:these => 'params'}
        assigns(:zone).should equal(mock_zone)
      end

      it "should re-render the 'new' template" do
        Zone.stub!(:new).and_return(mock_zone(:save => false))
        post :create, :zone => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested zone" do
        Zone.should_receive(:find).with("37").and_return(mock_zone)
        mock_zone.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :zone => {:these => 'params'}
      end

      it "should expose the requested zone as @zone" do
        Zone.stub!(:find).and_return(mock_zone(:update_attributes => true))
        put :update, :id => "1"
        assigns(:zone).should equal(mock_zone)
      end

      it "should redirect to the zone" do
        Zone.stub!(:find).and_return(mock_zone(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(zone_url(mock_zone))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested zone" do
        Zone.should_receive(:find).with("37").and_return(mock_zone)
        mock_zone.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :zone => {:these => 'params'}
      end

      it "should expose the zone as @zone" do
        Zone.stub!(:find).and_return(mock_zone(:update_attributes => false))
        put :update, :id => "1"
        assigns(:zone).should equal(mock_zone)
      end

      it "should re-render the 'edit' template" do
        Zone.stub!(:find).and_return(mock_zone(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested zone" do
      Zone.should_receive(:find).with("37").and_return(mock_zone)
      mock_zone.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the zones list" do
      Zone.stub!(:find).and_return(mock_zone(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(zones_url)
    end

  end

end
