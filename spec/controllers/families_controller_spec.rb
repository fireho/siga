require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FamiliesController do

  def mock_family(stubs={})
    @mock_family ||= mock_model(Family, stubs)
  end

      describe "When Logged In" do

    before(:each) do
      @login_warning= nil #{}"You need to be logged in to do that"
      autho_login_as :admin
    end


  describe "GET index" do

    it "exposes all families as @families" do
      Family.should_receive(:search).with(nil, nil).and_return([mock_family])
      get :index
      assigns[:families].should == [mock_family]
    end

    describe "with mime type of xml" do

      it "renders all families as xml" do
        Family.should_receive(:search).with(nil, nil).and_return(families = mock("Array of Families"))
        families.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested family as @family" do
      Family.should_receive(:find).with("37").and_return(mock_family)
      get :show, :id => "37"
      assigns[:family].should equal(mock_family)
    end

    describe "with mime type of xml" do

      it "renders the requested family as xml" do
        Family.should_receive(:find).with("37").and_return(mock_family)
        mock_family.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new family as @family" do
      Family.should_receive(:new).and_return(mock_family)
      get :new
      assigns[:family].should equal(mock_family)
    end

  end

  describe "GET edit" do

    it "exposes the requested family as @family" do
      Family.should_receive(:find).with("37").and_return(mock_family)
      get :edit, :id => "37"
      assigns[:family].should equal(mock_family)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created family as @family" do
        Family.should_receive(:new).with({'these' => 'params'}).and_return(mock_family(:save => true))
        post :create, :family => {:these => 'params'}
        assigns(:family).should equal(mock_family)
      end

      it "redirects to the created family" do
        Family.stub!(:new).and_return(mock_family(:save => true))
        post :create, :family => {}
        response.should redirect_to(family_url(mock_family))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved family as @family" do
        Family.stub!(:new).with({'these' => 'params'}).and_return(mock_family(:save => false))
        post :create, :family => {:these => 'params'}
        assigns(:family).should equal(mock_family)
      end

      it "re-renders the 'new' template" do
        Family.stub!(:new).and_return(mock_family(:save => false))
        post :create, :family => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested family" do
        Family.should_receive(:find).with("37").and_return(mock_family)
        mock_family.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :family => {:these => 'params'}
      end

      it "exposes the requested family as @family" do
        Family.stub!(:find).and_return(mock_family(:update_attributes => true))
        put :update, :id => "1"
        assigns(:family).should equal(mock_family)
      end

      it "redirects to the family" do
        Family.stub!(:find).and_return(mock_family(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(family_url(mock_family))
      end

    end

    describe "with invalid params" do

      it "updates the requested family" do
        Family.should_receive(:find).with("37").and_return(mock_family)
        mock_family.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :family => {:these => 'params'}
      end

      it "exposes the family as @family" do
        Family.stub!(:find).and_return(mock_family(:update_attributes => false))
        put :update, :id => "1"
        assigns(:family).should equal(mock_family)
      end

      it "re-renders the 'edit' template" do
        Family.stub!(:find).and_return(mock_family(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested family" do
      Family.should_receive(:find).with("37").and_return(mock_family)
      mock_family.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the families list" do
      Family.stub!(:find).and_return(mock_family(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(families_url)
    end

  end

end
end
