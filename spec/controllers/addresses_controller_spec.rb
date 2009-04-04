require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressesController do

  def mock_address(stubs={})
    @mock_address ||= mock_model(Address, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all addresses as @addresses" do
      Address.should_receive(:find).with(:all).and_return([mock_address])
      get :index
      assigns[:addresses].should == [mock_address]
    end

    describe "with mime type of xml" do
  
      it "should render all addresses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Address.should_receive(:find).with(:all).and_return(addresses = mock("Array of Addresses"))
        addresses.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested address as @address" do
      Address.should_receive(:find).with("37").and_return(mock_address)
      get :show, :id => "37"
      assigns[:address].should equal(mock_address)
    end
    
    describe "with mime type of xml" do

      it "should render the requested address as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Address.should_receive(:find).with("37").and_return(mock_address)
        mock_address.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new address as @address" do
      Address.should_receive(:new).and_return(mock_address)
      get :new
      assigns[:address].should equal(mock_address)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested address as @address" do
      Address.should_receive(:find).with("37").and_return(mock_address)
      get :edit, :id => "37"
      assigns[:address].should equal(mock_address)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created address as @address" do
        Address.should_receive(:new).with({'these' => 'params'}).and_return(mock_address(:save => true))
        post :create, :address => {:these => 'params'}
        assigns(:address).should equal(mock_address)
      end

      it "should redirect to the created address" do
        Address.stub!(:new).and_return(mock_address(:save => true))
        post :create, :address => {}
        response.should redirect_to(address_url(mock_address))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved address as @address" do
        Address.stub!(:new).with({'these' => 'params'}).and_return(mock_address(:save => false))
        post :create, :address => {:these => 'params'}
        assigns(:address).should equal(mock_address)
      end

      it "should re-render the 'new' template" do
        Address.stub!(:new).and_return(mock_address(:save => false))
        post :create, :address => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested address" do
        Address.should_receive(:find).with("37").and_return(mock_address)
        mock_address.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address => {:these => 'params'}
      end

      it "should expose the requested address as @address" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => true))
        put :update, :id => "1"
        assigns(:address).should equal(mock_address)
      end

      it "should redirect to the address" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(address_url(mock_address))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested address" do
        Address.should_receive(:find).with("37").and_return(mock_address)
        mock_address.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address => {:these => 'params'}
      end

      it "should expose the address as @address" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => false))
        put :update, :id => "1"
        assigns(:address).should equal(mock_address)
      end

      it "should re-render the 'edit' template" do
        Address.stub!(:find).and_return(mock_address(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested address" do
      Address.should_receive(:find).with("37").and_return(mock_address)
      mock_address.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the addresses list" do
      Address.stub!(:find).and_return(mock_address(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(addresses_url)
    end

  end

end
