require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DocumentsController do

  def mock_document(stubs={})
    @mock_document ||= mock_model(Document, stubs)
  end
  
  describe "GET index" do

    it "exposes all documents as @documents" do
      Document.should_receive(:find).with(:all).and_return([mock_document])
      get :index
      assigns[:documents].should == [mock_document]
    end

    describe "with mime type of xml" do
  
      it "renders all documents as xml" do
        Document.should_receive(:find).with(:all).and_return(documents = mock("Array of Documents"))
        documents.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested document as @document" do
      Document.should_receive(:find).with("37").and_return(mock_document)
      get :show, :id => "37"
      assigns[:document].should equal(mock_document)
    end
    
    describe "with mime type of xml" do

      it "renders the requested document as xml" do
        Document.should_receive(:find).with("37").and_return(mock_document)
        mock_document.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new document as @document" do
      Document.should_receive(:new).and_return(mock_document)
      get :new
      assigns[:document].should equal(mock_document)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested document as @document" do
      Document.should_receive(:find).with("37").and_return(mock_document)
      get :edit, :id => "37"
      assigns[:document].should equal(mock_document)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created document as @document" do
        Document.should_receive(:new).with({'these' => 'params'}).and_return(mock_document(:save => true))
        post :create, :document => {:these => 'params'}
        assigns(:document).should equal(mock_document)
      end

      it "redirects to the created document" do
        Document.stub!(:new).and_return(mock_document(:save => true))
        post :create, :document => {}
        response.should redirect_to(document_url(mock_document))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved document as @document" do
        Document.stub!(:new).with({'these' => 'params'}).and_return(mock_document(:save => false))
        post :create, :document => {:these => 'params'}
        assigns(:document).should equal(mock_document)
      end

      it "re-renders the 'new' template" do
        Document.stub!(:new).and_return(mock_document(:save => false))
        post :create, :document => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested document" do
        Document.should_receive(:find).with("37").and_return(mock_document)
        mock_document.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :document => {:these => 'params'}
      end

      it "exposes the requested document as @document" do
        Document.stub!(:find).and_return(mock_document(:update_attributes => true))
        put :update, :id => "1"
        assigns(:document).should equal(mock_document)
      end

      it "redirects to the document" do
        Document.stub!(:find).and_return(mock_document(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(document_url(mock_document))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested document" do
        Document.should_receive(:find).with("37").and_return(mock_document)
        mock_document.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :document => {:these => 'params'}
      end

      it "exposes the document as @document" do
        Document.stub!(:find).and_return(mock_document(:update_attributes => false))
        put :update, :id => "1"
        assigns(:document).should equal(mock_document)
      end

      it "re-renders the 'edit' template" do
        Document.stub!(:find).and_return(mock_document(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested document" do
      Document.should_receive(:find).with("37").and_return(mock_document)
      mock_document.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the documents list" do
      Document.stub!(:find).and_return(mock_document(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(documents_url)
    end

  end

end
