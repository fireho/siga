require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HeritagesController do

  def mock_heritage(stubs={})
    @mock_heritage ||= mock_model(Heritage, stubs)
  end

      describe "When Logged In" do

    before(:each) do
      @login_warning= nil #{}"You need to be logged in to do that"
      autho_login_as :admin
    end


  describe "GET index" do

    it "exposes all heritages as @heritages" do
      Heritage.should_receive(:search).with(nil, nil).and_return([mock_heritage])
      get :index
      assigns[:heritages].should == [mock_heritage]
    end

    describe "with mime type of xml" do

      it "renders all heritages as xml" do
        Heritage.should_receive(:search).with(nil, nil).and_return(heritages = mock("Array of Heritages"))
        heritages.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested heritage as @heritage" do
      Heritage.should_receive(:find).with("37").and_return(mock_heritage)
      get :show, :id => "37"
      assigns[:heritage].should equal(mock_heritage)
    end

    describe "with mime type of xml" do

      it "renders the requested heritage as xml" do
        Heritage.should_receive(:find).with("37").and_return(mock_heritage)
        mock_heritage.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new heritage as @heritage" do
      Heritage.should_receive(:new).and_return(mock_heritage)
      get :new
      assigns[:heritage].should equal(mock_heritage)
    end

  end

  describe "GET edit" do

    it "exposes the requested heritage as @heritage" do
      Heritage.should_receive(:find).with("37").and_return(mock_heritage)
      get :edit, :id => "37"
      assigns[:heritage].should equal(mock_heritage)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created heritage as @heritage" do
        Heritage.should_receive(:new).with({'these' => 'params'}).and_return(mock_heritage(:save => true))
        post :create, :heritage => {:these => 'params'}
        assigns(:heritage).should equal(mock_heritage)
      end

      it "redirects to the created heritage" do
        Heritage.stub!(:new).and_return(mock_heritage(:save => true))
        post :create, :heritage => {}
        response.should redirect_to(heritage_url(mock_heritage))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved heritage as @heritage" do
        Heritage.stub!(:new).with({'these' => 'params'}).and_return(mock_heritage(:save => false))
        post :create, :heritage => {:these => 'params'}
        assigns(:heritage).should equal(mock_heritage)
      end

      it "re-renders the 'new' template" do
        Heritage.stub!(:new).and_return(mock_heritage(:save => false))
        post :create, :heritage => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested heritage" do
        Heritage.should_receive(:find).with("37").and_return(mock_heritage)
        mock_heritage.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :heritage => {:these => 'params'}
      end

      it "exposes the requested heritage as @heritage" do
        Heritage.stub!(:find).and_return(mock_heritage(:update_attributes => true))
        put :update, :id => "1"
        assigns(:heritage).should equal(mock_heritage)
      end

      it "redirects to the heritage" do
        Heritage.stub!(:find).and_return(mock_heritage(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(heritage_url(mock_heritage))
      end

    end

    describe "with invalid params" do

      it "updates the requested heritage" do
        Heritage.should_receive(:find).with("37").and_return(mock_heritage)
        mock_heritage.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :heritage => {:these => 'params'}
      end

      it "exposes the heritage as @heritage" do
        Heritage.stub!(:find).and_return(mock_heritage(:update_attributes => false))
        put :update, :id => "1"
        assigns(:heritage).should equal(mock_heritage)
      end

      it "re-renders the 'edit' template" do
        Heritage.stub!(:find).and_return(mock_heritage(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested heritage" do
      Heritage.should_receive(:find).with("37").and_return(mock_heritage)
      mock_heritage.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the heritages list" do
      Heritage.stub!(:find).and_return(mock_heritage(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(heritages_url)
    end

  end

end
end
