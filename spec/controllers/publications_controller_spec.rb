require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PublicationsController do

  def mock_publication(stubs={})
    @mock_publication ||= mock_model(Publication, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all publications as @publications" do
      Publication.should_receive(:find).with(:all).and_return([mock_publication])
      get :index
      assigns[:publications].should == [mock_publication]
    end

    describe "with mime type of xml" do
  
      it "should render all publications as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Publication.should_receive(:find).with(:all).and_return(publications = mock("Array of Publications"))
        publications.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested publication as @publication" do
      Publication.should_receive(:find).with("37").and_return(mock_publication)
      get :show, :id => "37"
      assigns[:publication].should equal(mock_publication)
    end
    
    describe "with mime type of xml" do

      it "should render the requested publication as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Publication.should_receive(:find).with("37").and_return(mock_publication)
        mock_publication.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new publication as @publication" do
      Publication.should_receive(:new).and_return(mock_publication)
      get :new
      assigns[:publication].should equal(mock_publication)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested publication as @publication" do
      Publication.should_receive(:find).with("37").and_return(mock_publication)
      get :edit, :id => "37"
      assigns[:publication].should equal(mock_publication)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created publication as @publication" do
        Publication.should_receive(:new).with({'these' => 'params'}).and_return(mock_publication(:save => true))
        post :create, :publication => {:these => 'params'}
        assigns(:publication).should equal(mock_publication)
      end

      it "should redirect to the created publication" do
        Publication.stub!(:new).and_return(mock_publication(:save => true))
        post :create, :publication => {}
        response.should redirect_to(publication_url(mock_publication))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved publication as @publication" do
        Publication.stub!(:new).with({'these' => 'params'}).and_return(mock_publication(:save => false))
        post :create, :publication => {:these => 'params'}
        assigns(:publication).should equal(mock_publication)
      end

      it "should re-render the 'new' template" do
        Publication.stub!(:new).and_return(mock_publication(:save => false))
        post :create, :publication => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested publication" do
        Publication.should_receive(:find).with("37").and_return(mock_publication)
        mock_publication.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :publication => {:these => 'params'}
      end

      it "should expose the requested publication as @publication" do
        Publication.stub!(:find).and_return(mock_publication(:update_attributes => true))
        put :update, :id => "1"
        assigns(:publication).should equal(mock_publication)
      end

      it "should redirect to the publication" do
        Publication.stub!(:find).and_return(mock_publication(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(publication_url(mock_publication))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested publication" do
        Publication.should_receive(:find).with("37").and_return(mock_publication)
        mock_publication.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :publication => {:these => 'params'}
      end

      it "should expose the publication as @publication" do
        Publication.stub!(:find).and_return(mock_publication(:update_attributes => false))
        put :update, :id => "1"
        assigns(:publication).should equal(mock_publication)
      end

      it "should re-render the 'edit' template" do
        Publication.stub!(:find).and_return(mock_publication(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested publication" do
      Publication.should_receive(:find).with("37").and_return(mock_publication)
      mock_publication.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the publications list" do
      Publication.stub!(:find).and_return(mock_publication(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(publications_url)
    end

  end

end
