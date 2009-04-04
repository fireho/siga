require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PropertiesController do

  def mock_property(stubs={})
    @mock_property ||= mock_model(Property, stubs)
  end
  
  describe "GET index" do

    it "exposes all properties as @properties" do
      Property.should_receive(:find).with(:all).and_return([mock_property])
      get :index
      assigns[:properties].should == [mock_property]
    end

    describe "with mime type of xml" do
  
      it "renders all properties as xml" do
        Property.should_receive(:find).with(:all).and_return(properties = mock("Array of Properties"))
        properties.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested property as @property" do
      Property.should_receive(:find).with("37").and_return(mock_property)
      get :show, :id => "37"
      assigns[:property].should equal(mock_property)
    end
    
    describe "with mime type of xml" do

      it "renders the requested property as xml" do
        Property.should_receive(:find).with("37").and_return(mock_property)
        mock_property.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new property as @property" do
      Property.should_receive(:new).and_return(mock_property)
      get :new
      assigns[:property].should equal(mock_property)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested property as @property" do
      Property.should_receive(:find).with("37").and_return(mock_property)
      get :edit, :id => "37"
      assigns[:property].should equal(mock_property)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created property as @property" do
        Property.should_receive(:new).with({'these' => 'params'}).and_return(mock_property(:save => true))
        post :create, :property => {:these => 'params'}
        assigns(:property).should equal(mock_property)
      end

      it "redirects to the created property" do
        Property.stub!(:new).and_return(mock_property(:save => true))
        post :create, :property => {}
        response.should redirect_to(property_url(mock_property))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved property as @property" do
        Property.stub!(:new).with({'these' => 'params'}).and_return(mock_property(:save => false))
        post :create, :property => {:these => 'params'}
        assigns(:property).should equal(mock_property)
      end

      it "re-renders the 'new' template" do
        Property.stub!(:new).and_return(mock_property(:save => false))
        post :create, :property => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested property" do
        Property.should_receive(:find).with("37").and_return(mock_property)
        mock_property.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :property => {:these => 'params'}
      end

      it "exposes the requested property as @property" do
        Property.stub!(:find).and_return(mock_property(:update_attributes => true))
        put :update, :id => "1"
        assigns(:property).should equal(mock_property)
      end

      it "redirects to the property" do
        Property.stub!(:find).and_return(mock_property(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(property_url(mock_property))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested property" do
        Property.should_receive(:find).with("37").and_return(mock_property)
        mock_property.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :property => {:these => 'params'}
      end

      it "exposes the property as @property" do
        Property.stub!(:find).and_return(mock_property(:update_attributes => false))
        put :update, :id => "1"
        assigns(:property).should equal(mock_property)
      end

      it "re-renders the 'edit' template" do
        Property.stub!(:find).and_return(mock_property(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested property" do
      Property.should_receive(:find).with("37").and_return(mock_property)
      mock_property.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the properties list" do
      Property.stub!(:find).and_return(mock_property(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(properties_url)
    end

  end

end
