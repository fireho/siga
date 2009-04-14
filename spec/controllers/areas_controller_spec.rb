require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AreasController do

  def mock_area(stubs={})
    @mock_area ||= mock_model(Area, stubs)
  end

      describe "When Logged In" do

    before(:each) do
      @login_warning= nil #{}"You need to be logged in to do that"
      autho_login_as :admin
    end


  describe "GET index" do

    it "exposes all areas as @areas" do
      Area.should_receive(:search).with(nil, nil).and_return([mock_area])
      get :index
      assigns[:areas].should == [mock_area]
    end

    describe "with mime type of xml" do

      it "renders all areas as xml" do
        Area.should_receive(:search).with(nil, nil).and_return(areas = mock("Array of Areas"))
        areas.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested area as @area" do
      Area.should_receive(:find).with("37").and_return(mock_area)
      get :show, :id => "37"
      assigns[:area].should equal(mock_area)
    end

    describe "with mime type of xml" do

      it "renders the requested area as xml" do
        Area.should_receive(:find).with("37").and_return(mock_area)
        mock_area.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new area as @area" do
      Area.should_receive(:new).and_return(mock_area)
      get :new
      assigns[:area].should equal(mock_area)
    end

  end

  describe "GET edit" do

    it "exposes the requested area as @area" do
      Area.should_receive(:find).with("37").and_return(mock_area)
      get :edit, :id => "37"
      assigns[:area].should equal(mock_area)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created area as @area" do
        Area.should_receive(:new).with({'these' => 'params'}).and_return(mock_area(:save => true))
        post :create, :area => {:these => 'params'}
        assigns(:area).should equal(mock_area)
      end

      it "redirects to the created area" do
        Area.stub!(:new).and_return(mock_area(:save => true))
        post :create, :area => {}
        response.should redirect_to(area_url(mock_area))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved area as @area" do
        Area.stub!(:new).with({'these' => 'params'}).and_return(mock_area(:save => false))
        post :create, :area => {:these => 'params'}
        assigns(:area).should equal(mock_area)
      end

      it "re-renders the 'new' template" do
        Area.stub!(:new).and_return(mock_area(:save => false))
        post :create, :area => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested area" do
        Area.should_receive(:find).with("37").and_return(mock_area)
        mock_area.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :area => {:these => 'params'}
      end

      it "exposes the requested area as @area" do
        Area.stub!(:find).and_return(mock_area(:update_attributes => true))
        put :update, :id => "1"
        assigns(:area).should equal(mock_area)
      end

      it "redirects to the area" do
        Area.stub!(:find).and_return(mock_area(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(area_url(mock_area))
      end

    end

    describe "with invalid params" do

      it "updates the requested area" do
        Area.should_receive(:find).with("37").and_return(mock_area)
        mock_area.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :area => {:these => 'params'}
      end

      it "exposes the area as @area" do
        Area.stub!(:find).and_return(mock_area(:update_attributes => false))
        put :update, :id => "1"
        assigns(:area).should equal(mock_area)
      end

      it "re-renders the 'edit' template" do
        Area.stub!(:find).and_return(mock_area(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested area" do
      Area.should_receive(:find).with("37").and_return(mock_area)
      mock_area.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the areas list" do
      Area.stub!(:find).and_return(mock_area(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(areas_url)
    end

  end

end
end
