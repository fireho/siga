require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReceiptsController do

  def mock_receipt(stubs={})
    @mock_receipt ||= mock_model(Receipt, stubs)
  end
  
  describe "GET index" do

    it "exposes all receipts as @receipts" do
      Receipt.should_receive(:find).with(:all).and_return([mock_receipt])
      get :index
      assigns[:receipts].should == [mock_receipt]
    end

    describe "with mime type of xml" do
  
      it "renders all receipts as xml" do
        Receipt.should_receive(:find).with(:all).and_return(receipts = mock("Array of Receipts"))
        receipts.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested receipt as @receipt" do
      Receipt.should_receive(:find).with("37").and_return(mock_receipt)
      get :show, :id => "37"
      assigns[:receipt].should equal(mock_receipt)
    end
    
    describe "with mime type of xml" do

      it "renders the requested receipt as xml" do
        Receipt.should_receive(:find).with("37").and_return(mock_receipt)
        mock_receipt.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new receipt as @receipt" do
      Receipt.should_receive(:new).and_return(mock_receipt)
      get :new
      assigns[:receipt].should equal(mock_receipt)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested receipt as @receipt" do
      Receipt.should_receive(:find).with("37").and_return(mock_receipt)
      get :edit, :id => "37"
      assigns[:receipt].should equal(mock_receipt)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created receipt as @receipt" do
        Receipt.should_receive(:new).with({'these' => 'params'}).and_return(mock_receipt(:save => true))
        post :create, :receipt => {:these => 'params'}
        assigns(:receipt).should equal(mock_receipt)
      end

      it "redirects to the created receipt" do
        Receipt.stub!(:new).and_return(mock_receipt(:save => true))
        post :create, :receipt => {}
        response.should redirect_to(receipt_url(mock_receipt))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved receipt as @receipt" do
        Receipt.stub!(:new).with({'these' => 'params'}).and_return(mock_receipt(:save => false))
        post :create, :receipt => {:these => 'params'}
        assigns(:receipt).should equal(mock_receipt)
      end

      it "re-renders the 'new' template" do
        Receipt.stub!(:new).and_return(mock_receipt(:save => false))
        post :create, :receipt => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested receipt" do
        Receipt.should_receive(:find).with("37").and_return(mock_receipt)
        mock_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :receipt => {:these => 'params'}
      end

      it "exposes the requested receipt as @receipt" do
        Receipt.stub!(:find).and_return(mock_receipt(:update_attributes => true))
        put :update, :id => "1"
        assigns(:receipt).should equal(mock_receipt)
      end

      it "redirects to the receipt" do
        Receipt.stub!(:find).and_return(mock_receipt(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(receipt_url(mock_receipt))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested receipt" do
        Receipt.should_receive(:find).with("37").and_return(mock_receipt)
        mock_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :receipt => {:these => 'params'}
      end

      it "exposes the receipt as @receipt" do
        Receipt.stub!(:find).and_return(mock_receipt(:update_attributes => false))
        put :update, :id => "1"
        assigns(:receipt).should equal(mock_receipt)
      end

      it "re-renders the 'edit' template" do
        Receipt.stub!(:find).and_return(mock_receipt(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested receipt" do
      Receipt.should_receive(:find).with("37").and_return(mock_receipt)
      mock_receipt.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the receipts list" do
      Receipt.stub!(:find).and_return(mock_receipt(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(receipts_url)
    end

  end

end
