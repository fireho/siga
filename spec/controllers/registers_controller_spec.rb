require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RegistersController do

  def mock_register(stubs={})
    @mock_register ||= mock_model(Register, stubs)
  end
  
  describe "GET index" do

    it "exposes all registers as @registers" do
      Register.should_receive(:find).with(:all).and_return([mock_register])
      get :index
      assigns[:registers].should == [mock_register]
    end

    describe "with mime type of xml" do
  
      it "renders all registers as xml" do
        Register.should_receive(:find).with(:all).and_return(registers = mock("Array of Registers"))
        registers.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested register as @register" do
      Register.should_receive(:find).with("37").and_return(mock_register)
      get :show, :id => "37"
      assigns[:register].should equal(mock_register)
    end
    
    describe "with mime type of xml" do

      it "renders the requested register as xml" do
        Register.should_receive(:find).with("37").and_return(mock_register)
        mock_register.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new register as @register" do
      Register.should_receive(:new).and_return(mock_register)
      get :new
      assigns[:register].should equal(mock_register)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested register as @register" do
      Register.should_receive(:find).with("37").and_return(mock_register)
      get :edit, :id => "37"
      assigns[:register].should equal(mock_register)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created register as @register" do
        Register.should_receive(:new).with({'these' => 'params'}).and_return(mock_register(:save => true))
        post :create, :register => {:these => 'params'}
        assigns(:register).should equal(mock_register)
      end

      it "redirects to the created register" do
        Register.stub!(:new).and_return(mock_register(:save => true))
        post :create, :register => {}
        response.should redirect_to(register_url(mock_register))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved register as @register" do
        Register.stub!(:new).with({'these' => 'params'}).and_return(mock_register(:save => false))
        post :create, :register => {:these => 'params'}
        assigns(:register).should equal(mock_register)
      end

      it "re-renders the 'new' template" do
        Register.stub!(:new).and_return(mock_register(:save => false))
        post :create, :register => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested register" do
        Register.should_receive(:find).with("37").and_return(mock_register)
        mock_register.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :register => {:these => 'params'}
      end

      it "exposes the requested register as @register" do
        Register.stub!(:find).and_return(mock_register(:update_attributes => true))
        put :update, :id => "1"
        assigns(:register).should equal(mock_register)
      end

      it "redirects to the register" do
        Register.stub!(:find).and_return(mock_register(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(register_url(mock_register))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested register" do
        Register.should_receive(:find).with("37").and_return(mock_register)
        mock_register.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :register => {:these => 'params'}
      end

      it "exposes the register as @register" do
        Register.stub!(:find).and_return(mock_register(:update_attributes => false))
        put :update, :id => "1"
        assigns(:register).should equal(mock_register)
      end

      it "re-renders the 'edit' template" do
        Register.stub!(:find).and_return(mock_register(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested register" do
      Register.should_receive(:find).with("37").and_return(mock_register)
      mock_register.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the registers list" do
      Register.stub!(:find).and_return(mock_register(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(registers_url)
    end

  end

end
