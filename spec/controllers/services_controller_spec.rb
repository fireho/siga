require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServicesController do

  def mock_service(stubs={})
    @mock_service ||= mock_model(Service, stubs)
  end
  
  describe "GET index" do

    it "exposes all services as @services" do
      Service.should_receive(:find).with(:all).and_return([mock_service])
      get :index
      assigns[:services].should == [mock_service]
    end

    describe "with mime type of xml" do
  
      it "renders all services as xml" do
        Service.should_receive(:find).with(:all).and_return(services = mock("Array of Services"))
        services.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested service as @service" do
      Service.should_receive(:find).with("37").and_return(mock_service)
      get :show, :id => "37"
      assigns[:service].should equal(mock_service)
    end
    
    describe "with mime type of xml" do

      it "renders the requested service as xml" do
        Service.should_receive(:find).with("37").and_return(mock_service)
        mock_service.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new service as @service" do
      Service.should_receive(:new).and_return(mock_service)
      get :new
      assigns[:service].should equal(mock_service)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested service as @service" do
      Service.should_receive(:find).with("37").and_return(mock_service)
      get :edit, :id => "37"
      assigns[:service].should equal(mock_service)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created service as @service" do
        Service.should_receive(:new).with({'these' => 'params'}).and_return(mock_service(:save => true))
        post :create, :service => {:these => 'params'}
        assigns(:service).should equal(mock_service)
      end

      it "redirects to the created service" do
        Service.stub!(:new).and_return(mock_service(:save => true))
        post :create, :service => {}
        response.should redirect_to(service_url(mock_service))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved service as @service" do
        Service.stub!(:new).with({'these' => 'params'}).and_return(mock_service(:save => false))
        post :create, :service => {:these => 'params'}
        assigns(:service).should equal(mock_service)
      end

      it "re-renders the 'new' template" do
        Service.stub!(:new).and_return(mock_service(:save => false))
        post :create, :service => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested service" do
        Service.should_receive(:find).with("37").and_return(mock_service)
        mock_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :service => {:these => 'params'}
      end

      it "exposes the requested service as @service" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => true))
        put :update, :id => "1"
        assigns(:service).should equal(mock_service)
      end

      it "redirects to the service" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(service_url(mock_service))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested service" do
        Service.should_receive(:find).with("37").and_return(mock_service)
        mock_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :service => {:these => 'params'}
      end

      it "exposes the service as @service" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => false))
        put :update, :id => "1"
        assigns(:service).should equal(mock_service)
      end

      it "re-renders the 'edit' template" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested service" do
      Service.should_receive(:find).with("37").and_return(mock_service)
      mock_service.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the services list" do
      Service.stub!(:find).and_return(mock_service(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(services_url)
    end

  end

end
