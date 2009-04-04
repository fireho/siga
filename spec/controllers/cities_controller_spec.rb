require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CitiesController do

  def mock_city(stubs={})
    @mock_city ||= mock_model(City, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all cities as @cities" do
      City.should_receive(:find).with(:all).and_return([mock_city])
      get :index
      assigns[:cities].should == [mock_city]
    end

    describe "with mime type of xml" do
  
      it "should render all cities as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        City.should_receive(:find).with(:all).and_return(cities = mock("Array of Cities"))
        cities.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested city as @city" do
      City.should_receive(:find).with("37").and_return(mock_city)
      get :show, :id => "37"
      assigns[:city].should equal(mock_city)
    end
    
    describe "with mime type of xml" do

      it "should render the requested city as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        City.should_receive(:find).with("37").and_return(mock_city)
        mock_city.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new city as @city" do
      City.should_receive(:new).and_return(mock_city)
      get :new
      assigns[:city].should equal(mock_city)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested city as @city" do
      City.should_receive(:find).with("37").and_return(mock_city)
      get :edit, :id => "37"
      assigns[:city].should equal(mock_city)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created city as @city" do
        City.should_receive(:new).with({'these' => 'params'}).and_return(mock_city(:save => true))
        post :create, :city => {:these => 'params'}
        assigns(:city).should equal(mock_city)
      end

      it "should redirect to the created city" do
        City.stub!(:new).and_return(mock_city(:save => true))
        post :create, :city => {}
        response.should redirect_to(city_url(mock_city))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved city as @city" do
        City.stub!(:new).with({'these' => 'params'}).and_return(mock_city(:save => false))
        post :create, :city => {:these => 'params'}
        assigns(:city).should equal(mock_city)
      end

      it "should re-render the 'new' template" do
        City.stub!(:new).and_return(mock_city(:save => false))
        post :create, :city => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested city" do
        City.should_receive(:find).with("37").and_return(mock_city)
        mock_city.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :city => {:these => 'params'}
      end

      it "should expose the requested city as @city" do
        City.stub!(:find).and_return(mock_city(:update_attributes => true))
        put :update, :id => "1"
        assigns(:city).should equal(mock_city)
      end

      it "should redirect to the city" do
        City.stub!(:find).and_return(mock_city(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(city_url(mock_city))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested city" do
        City.should_receive(:find).with("37").and_return(mock_city)
        mock_city.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :city => {:these => 'params'}
      end

      it "should expose the city as @city" do
        City.stub!(:find).and_return(mock_city(:update_attributes => false))
        put :update, :id => "1"
        assigns(:city).should equal(mock_city)
      end

      it "should re-render the 'edit' template" do
        City.stub!(:find).and_return(mock_city(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested city" do
      City.should_receive(:find).with("37").and_return(mock_city)
      mock_city.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the cities list" do
      City.stub!(:find).and_return(mock_city(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cities_url)
    end

  end

end
