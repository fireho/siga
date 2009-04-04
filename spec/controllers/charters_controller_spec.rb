require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ChartersController do

  def mock_charter(stubs={})
    @mock_charter ||= mock_model(Charter, stubs)
  end
  
  describe "GET index" do

    it "exposes all charters as @charters" do
      Charter.should_receive(:find).with(:all).and_return([mock_charter])
      get :index
      assigns[:charters].should == [mock_charter]
    end

    describe "with mime type of xml" do
  
      it "renders all charters as xml" do
        Charter.should_receive(:find).with(:all).and_return(charters = mock("Array of Charters"))
        charters.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested charter as @charter" do
      Charter.should_receive(:find).with("37").and_return(mock_charter)
      get :show, :id => "37"
      assigns[:charter].should equal(mock_charter)
    end
    
    describe "with mime type of xml" do

      it "renders the requested charter as xml" do
        Charter.should_receive(:find).with("37").and_return(mock_charter)
        mock_charter.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new charter as @charter" do
      Charter.should_receive(:new).and_return(mock_charter)
      get :new
      assigns[:charter].should equal(mock_charter)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested charter as @charter" do
      Charter.should_receive(:find).with("37").and_return(mock_charter)
      get :edit, :id => "37"
      assigns[:charter].should equal(mock_charter)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created charter as @charter" do
        Charter.should_receive(:new).with({'these' => 'params'}).and_return(mock_charter(:save => true))
        post :create, :charter => {:these => 'params'}
        assigns(:charter).should equal(mock_charter)
      end

      it "redirects to the created charter" do
        Charter.stub!(:new).and_return(mock_charter(:save => true))
        post :create, :charter => {}
        response.should redirect_to(charter_url(mock_charter))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved charter as @charter" do
        Charter.stub!(:new).with({'these' => 'params'}).and_return(mock_charter(:save => false))
        post :create, :charter => {:these => 'params'}
        assigns(:charter).should equal(mock_charter)
      end

      it "re-renders the 'new' template" do
        Charter.stub!(:new).and_return(mock_charter(:save => false))
        post :create, :charter => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested charter" do
        Charter.should_receive(:find).with("37").and_return(mock_charter)
        mock_charter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :charter => {:these => 'params'}
      end

      it "exposes the requested charter as @charter" do
        Charter.stub!(:find).and_return(mock_charter(:update_attributes => true))
        put :update, :id => "1"
        assigns(:charter).should equal(mock_charter)
      end

      it "redirects to the charter" do
        Charter.stub!(:find).and_return(mock_charter(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(charter_url(mock_charter))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested charter" do
        Charter.should_receive(:find).with("37").and_return(mock_charter)
        mock_charter.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :charter => {:these => 'params'}
      end

      it "exposes the charter as @charter" do
        Charter.stub!(:find).and_return(mock_charter(:update_attributes => false))
        put :update, :id => "1"
        assigns(:charter).should equal(mock_charter)
      end

      it "re-renders the 'edit' template" do
        Charter.stub!(:find).and_return(mock_charter(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested charter" do
      Charter.should_receive(:find).with("37").and_return(mock_charter)
      mock_charter.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the charters list" do
      Charter.stub!(:find).and_return(mock_charter(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(charters_url)
    end

  end

end
