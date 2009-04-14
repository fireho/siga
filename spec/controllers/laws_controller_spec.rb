require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LawsController do

  def mock_law(stubs={})
    @mock_law ||= mock_model(Law, stubs)
  end

  describe "GET index" do

    it "exposes all laws as @laws" do
      Law.should_receive(:search).with(nil, nil).and_return([mock_law])
      get :index
      assigns[:laws].should == [mock_law]
    end

    describe "with mime type of xml" do

      it "renders all laws as xml" do
        Law.should_receive(:search).with(nil, nil).and_return(laws = mock("Array of Laws"))
        laws.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested law as @law" do
      Law.should_receive(:find).with("37").and_return(mock_law)
      get :show, :id => "37"
      assigns[:law].should equal(mock_law)
    end

    describe "with mime type of xml" do

      it "renders the requested law as xml" do
        Law.should_receive(:find).with("37").and_return(mock_law)
        mock_law.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new law as @law" do
      Law.should_receive(:new).and_return(mock_law)
      get :new
      assigns[:law].should equal(mock_law)
    end

  end

  describe "GET edit" do

    it "exposes the requested law as @law" do
      Law.should_receive(:find).with("37").and_return(mock_law)
      get :edit, :id => "37"
      assigns[:law].should equal(mock_law)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created law as @law" do
        Law.should_receive(:new).with({'these' => 'params'}).and_return(mock_law(:save => true))
        post :create, :law => {:these => 'params'}
        assigns(:law).should equal(mock_law)
      end

      it "redirects to the created law" do
        Law.stub!(:new).and_return(mock_law(:save => true))
        post :create, :law => {}
        response.should redirect_to(law_url(mock_law))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved law as @law" do
        Law.stub!(:new).with({'these' => 'params'}).and_return(mock_law(:save => false))
        post :create, :law => {:these => 'params'}
        assigns(:law).should equal(mock_law)
      end

      it "re-renders the 'new' template" do
        Law.stub!(:new).and_return(mock_law(:save => false))
        post :create, :law => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested law" do
        Law.should_receive(:find).with("37").and_return(mock_law)
        mock_law.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :law => {:these => 'params'}
      end

      it "exposes the requested law as @law" do
        Law.stub!(:find).and_return(mock_law(:update_attributes => true))
        put :update, :id => "1"
        assigns(:law).should equal(mock_law)
      end

      it "redirects to the law" do
        Law.stub!(:find).and_return(mock_law(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(law_url(mock_law))
      end

    end

    describe "with invalid params" do

      it "updates the requested law" do
        Law.should_receive(:find).with("37").and_return(mock_law)
        mock_law.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :law => {:these => 'params'}
      end

      it "exposes the law as @law" do
        Law.stub!(:find).and_return(mock_law(:update_attributes => false))
        put :update, :id => "1"
        assigns(:law).should equal(mock_law)
      end

      it "re-renders the 'edit' template" do
        Law.stub!(:find).and_return(mock_law(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested law" do
      Law.should_receive(:find).with("37").and_return(mock_law)
      mock_law.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the laws list" do
      Law.stub!(:find).and_return(mock_law(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(laws_url)
    end

  end

end
