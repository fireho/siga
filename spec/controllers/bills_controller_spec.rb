require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BillsController do

  def mock_bill(stubs={})
    @mock_bill ||= mock_model(Bill, stubs)
  end
  
  describe "GET index" do

    it "exposes all bills as @bills" do
      Bill.should_receive(:find).with(:all).and_return([mock_bill])
      get :index
      assigns[:bills].should == [mock_bill]
    end

    describe "with mime type of xml" do
  
      it "renders all bills as xml" do
        Bill.should_receive(:find).with(:all).and_return(bills = mock("Array of Bills"))
        bills.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested bill as @bill" do
      Bill.should_receive(:find).with("37").and_return(mock_bill)
      get :show, :id => "37"
      assigns[:bill].should equal(mock_bill)
    end
    
    describe "with mime type of xml" do

      it "renders the requested bill as xml" do
        Bill.should_receive(:find).with("37").and_return(mock_bill)
        mock_bill.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new bill as @bill" do
      Bill.should_receive(:new).and_return(mock_bill)
      get :new
      assigns[:bill].should equal(mock_bill)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested bill as @bill" do
      Bill.should_receive(:find).with("37").and_return(mock_bill)
      get :edit, :id => "37"
      assigns[:bill].should equal(mock_bill)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created bill as @bill" do
        Bill.should_receive(:new).with({'these' => 'params'}).and_return(mock_bill(:save => true))
        post :create, :bill => {:these => 'params'}
        assigns(:bill).should equal(mock_bill)
      end

      it "redirects to the created bill" do
        Bill.stub!(:new).and_return(mock_bill(:save => true))
        post :create, :bill => {}
        response.should redirect_to(bill_url(mock_bill))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved bill as @bill" do
        Bill.stub!(:new).with({'these' => 'params'}).and_return(mock_bill(:save => false))
        post :create, :bill => {:these => 'params'}
        assigns(:bill).should equal(mock_bill)
      end

      it "re-renders the 'new' template" do
        Bill.stub!(:new).and_return(mock_bill(:save => false))
        post :create, :bill => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested bill" do
        Bill.should_receive(:find).with("37").and_return(mock_bill)
        mock_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bill => {:these => 'params'}
      end

      it "exposes the requested bill as @bill" do
        Bill.stub!(:find).and_return(mock_bill(:update_attributes => true))
        put :update, :id => "1"
        assigns(:bill).should equal(mock_bill)
      end

      it "redirects to the bill" do
        Bill.stub!(:find).and_return(mock_bill(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(bill_url(mock_bill))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested bill" do
        Bill.should_receive(:find).with("37").and_return(mock_bill)
        mock_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :bill => {:these => 'params'}
      end

      it "exposes the bill as @bill" do
        Bill.stub!(:find).and_return(mock_bill(:update_attributes => false))
        put :update, :id => "1"
        assigns(:bill).should equal(mock_bill)
      end

      it "re-renders the 'edit' template" do
        Bill.stub!(:find).and_return(mock_bill(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested bill" do
      Bill.should_receive(:find).with("37").and_return(mock_bill)
      mock_bill.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the bills list" do
      Bill.stub!(:find).and_return(mock_bill(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(bills_url)
    end

  end

end
