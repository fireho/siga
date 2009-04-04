require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProcurementsController do

  def mock_procurement(stubs={})
    @mock_procurement ||= mock_model(Procurement, stubs)
  end
  
  describe "GET index" do

    it "exposes all procurements as @procurements" do
      Procurement.should_receive(:find).with(:all).and_return([mock_procurement])
      get :index
      assigns[:procurements].should == [mock_procurement]
    end

    describe "with mime type of xml" do
  
      it "renders all procurements as xml" do
        Procurement.should_receive(:find).with(:all).and_return(procurements = mock("Array of Procurements"))
        procurements.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested procurement as @procurement" do
      Procurement.should_receive(:find).with("37").and_return(mock_procurement)
      get :show, :id => "37"
      assigns[:procurement].should equal(mock_procurement)
    end
    
    describe "with mime type of xml" do

      it "renders the requested procurement as xml" do
        Procurement.should_receive(:find).with("37").and_return(mock_procurement)
        mock_procurement.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new procurement as @procurement" do
      Procurement.should_receive(:new).and_return(mock_procurement)
      get :new
      assigns[:procurement].should equal(mock_procurement)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested procurement as @procurement" do
      Procurement.should_receive(:find).with("37").and_return(mock_procurement)
      get :edit, :id => "37"
      assigns[:procurement].should equal(mock_procurement)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created procurement as @procurement" do
        Procurement.should_receive(:new).with({'these' => 'params'}).and_return(mock_procurement(:save => true))
        post :create, :procurement => {:these => 'params'}
        assigns(:procurement).should equal(mock_procurement)
      end

      it "redirects to the created procurement" do
        Procurement.stub!(:new).and_return(mock_procurement(:save => true))
        post :create, :procurement => {}
        response.should redirect_to(procurement_url(mock_procurement))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved procurement as @procurement" do
        Procurement.stub!(:new).with({'these' => 'params'}).and_return(mock_procurement(:save => false))
        post :create, :procurement => {:these => 'params'}
        assigns(:procurement).should equal(mock_procurement)
      end

      it "re-renders the 'new' template" do
        Procurement.stub!(:new).and_return(mock_procurement(:save => false))
        post :create, :procurement => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested procurement" do
        Procurement.should_receive(:find).with("37").and_return(mock_procurement)
        mock_procurement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :procurement => {:these => 'params'}
      end

      it "exposes the requested procurement as @procurement" do
        Procurement.stub!(:find).and_return(mock_procurement(:update_attributes => true))
        put :update, :id => "1"
        assigns(:procurement).should equal(mock_procurement)
      end

      it "redirects to the procurement" do
        Procurement.stub!(:find).and_return(mock_procurement(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(procurement_url(mock_procurement))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested procurement" do
        Procurement.should_receive(:find).with("37").and_return(mock_procurement)
        mock_procurement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :procurement => {:these => 'params'}
      end

      it "exposes the procurement as @procurement" do
        Procurement.stub!(:find).and_return(mock_procurement(:update_attributes => false))
        put :update, :id => "1"
        assigns(:procurement).should equal(mock_procurement)
      end

      it "re-renders the 'edit' template" do
        Procurement.stub!(:find).and_return(mock_procurement(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested procurement" do
      Procurement.should_receive(:find).with("37").and_return(mock_procurement)
      mock_procurement.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the procurements list" do
      Procurement.stub!(:find).and_return(mock_procurement(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(procurements_url)
    end

  end

end
