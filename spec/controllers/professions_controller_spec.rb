require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProfessionsController do

  def mock_profession(stubs={})
    @mock_profession ||= mock_model(Profession, stubs)
  end
  
  describe "GET index" do

    it "exposes all professions as @professions" do
      Profession.should_receive(:find).with(:all).and_return([mock_profession])
      get :index
      assigns[:professions].should == [mock_profession]
    end

    describe "with mime type of xml" do
  
      it "renders all professions as xml" do
        Profession.should_receive(:find).with(:all).and_return(professions = mock("Array of Professions"))
        professions.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested profession as @profession" do
      Profession.should_receive(:find).with("37").and_return(mock_profession)
      get :show, :id => "37"
      assigns[:profession].should equal(mock_profession)
    end
    
    describe "with mime type of xml" do

      it "renders the requested profession as xml" do
        Profession.should_receive(:find).with("37").and_return(mock_profession)
        mock_profession.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new profession as @profession" do
      Profession.should_receive(:new).and_return(mock_profession)
      get :new
      assigns[:profession].should equal(mock_profession)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested profession as @profession" do
      Profession.should_receive(:find).with("37").and_return(mock_profession)
      get :edit, :id => "37"
      assigns[:profession].should equal(mock_profession)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created profession as @profession" do
        Profession.should_receive(:new).with({'these' => 'params'}).and_return(mock_profession(:save => true))
        post :create, :profession => {:these => 'params'}
        assigns(:profession).should equal(mock_profession)
      end

      it "redirects to the created profession" do
        Profession.stub!(:new).and_return(mock_profession(:save => true))
        post :create, :profession => {}
        response.should redirect_to(profession_url(mock_profession))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved profession as @profession" do
        Profession.stub!(:new).with({'these' => 'params'}).and_return(mock_profession(:save => false))
        post :create, :profession => {:these => 'params'}
        assigns(:profession).should equal(mock_profession)
      end

      it "re-renders the 'new' template" do
        Profession.stub!(:new).and_return(mock_profession(:save => false))
        post :create, :profession => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested profession" do
        Profession.should_receive(:find).with("37").and_return(mock_profession)
        mock_profession.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :profession => {:these => 'params'}
      end

      it "exposes the requested profession as @profession" do
        Profession.stub!(:find).and_return(mock_profession(:update_attributes => true))
        put :update, :id => "1"
        assigns(:profession).should equal(mock_profession)
      end

      it "redirects to the profession" do
        Profession.stub!(:find).and_return(mock_profession(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(profession_url(mock_profession))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested profession" do
        Profession.should_receive(:find).with("37").and_return(mock_profession)
        mock_profession.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :profession => {:these => 'params'}
      end

      it "exposes the profession as @profession" do
        Profession.stub!(:find).and_return(mock_profession(:update_attributes => false))
        put :update, :id => "1"
        assigns(:profession).should equal(mock_profession)
      end

      it "re-renders the 'edit' template" do
        Profession.stub!(:find).and_return(mock_profession(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested profession" do
      Profession.should_receive(:find).with("37").and_return(mock_profession)
      mock_profession.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the professions list" do
      Profession.stub!(:find).and_return(mock_profession(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(professions_url)
    end

  end

end
