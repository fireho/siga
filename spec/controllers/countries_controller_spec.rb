require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CountriesController do

  def mock_country(stubs={})
    @mock_country ||= mock_model(Country, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all countries as @countries" do
      Country.should_receive(:find).with(:all).and_return([mock_country])
      get :index
      assigns[:countries].should == [mock_country]
    end

    describe "with mime type of xml" do
  
      it "should render all countries as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Country.should_receive(:find).with(:all).and_return(countries = mock("Array of Countries"))
        countries.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested country as @country" do
      Country.should_receive(:find).with("37").and_return(mock_country)
      get :show, :id => "37"
      assigns[:country].should equal(mock_country)
    end
    
    describe "with mime type of xml" do

      it "should render the requested country as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Country.should_receive(:find).with("37").and_return(mock_country)
        mock_country.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new country as @country" do
      Country.should_receive(:new).and_return(mock_country)
      get :new
      assigns[:country].should equal(mock_country)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested country as @country" do
      Country.should_receive(:find).with("37").and_return(mock_country)
      get :edit, :id => "37"
      assigns[:country].should equal(mock_country)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created country as @country" do
        Country.should_receive(:new).with({'these' => 'params'}).and_return(mock_country(:save => true))
        post :create, :country => {:these => 'params'}
        assigns(:country).should equal(mock_country)
      end

      it "should redirect to the created country" do
        Country.stub!(:new).and_return(mock_country(:save => true))
        post :create, :country => {}
        response.should redirect_to(country_url(mock_country))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved country as @country" do
        Country.stub!(:new).with({'these' => 'params'}).and_return(mock_country(:save => false))
        post :create, :country => {:these => 'params'}
        assigns(:country).should equal(mock_country)
      end

      it "should re-render the 'new' template" do
        Country.stub!(:new).and_return(mock_country(:save => false))
        post :create, :country => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested country" do
        Country.should_receive(:find).with("37").and_return(mock_country)
        mock_country.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :country => {:these => 'params'}
      end

      it "should expose the requested country as @country" do
        Country.stub!(:find).and_return(mock_country(:update_attributes => true))
        put :update, :id => "1"
        assigns(:country).should equal(mock_country)
      end

      it "should redirect to the country" do
        Country.stub!(:find).and_return(mock_country(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(country_url(mock_country))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested country" do
        Country.should_receive(:find).with("37").and_return(mock_country)
        mock_country.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :country => {:these => 'params'}
      end

      it "should expose the country as @country" do
        Country.stub!(:find).and_return(mock_country(:update_attributes => false))
        put :update, :id => "1"
        assigns(:country).should equal(mock_country)
      end

      it "should re-render the 'edit' template" do
        Country.stub!(:find).and_return(mock_country(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested country" do
      Country.should_receive(:find).with("37").and_return(mock_country)
      mock_country.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the countries list" do
      Country.stub!(:find).and_return(mock_country(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(countries_url)
    end

  end

end
