require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AttachmentsController do

  def mock_attachment(stubs={})
    @mock_attachment ||= mock_model(Attachment, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all attachments as @attachments" do
      Attachment.should_receive(:find).with(:all).and_return([mock_attachment])
      get :index
      assigns[:attachments].should == [mock_attachment]
    end

    describe "with mime type of xml" do
  
      it "should render all attachments as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Attachment.should_receive(:find).with(:all).and_return(attachments = mock("Array of Attachments"))
        attachments.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested attachment as @attachment" do
      Attachment.should_receive(:find).with("37").and_return(mock_attachment)
      get :show, :id => "37"
      assigns[:attachment].should equal(mock_attachment)
    end
    
    describe "with mime type of xml" do

      it "should render the requested attachment as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Attachment.should_receive(:find).with("37").and_return(mock_attachment)
        mock_attachment.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new attachment as @attachment" do
      Attachment.should_receive(:new).and_return(mock_attachment)
      get :new
      assigns[:attachment].should equal(mock_attachment)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested attachment as @attachment" do
      Attachment.should_receive(:find).with("37").and_return(mock_attachment)
      get :edit, :id => "37"
      assigns[:attachment].should equal(mock_attachment)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created attachment as @attachment" do
        Attachment.should_receive(:new).with({'these' => 'params'}).and_return(mock_attachment(:save => true))
        post :create, :attachment => {:these => 'params'}
        assigns(:attachment).should equal(mock_attachment)
      end

      it "should redirect to the created attachment" do
        Attachment.stub!(:new).and_return(mock_attachment(:save => true))
        post :create, :attachment => {}
        response.should redirect_to(attachment_url(mock_attachment))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved attachment as @attachment" do
        Attachment.stub!(:new).with({'these' => 'params'}).and_return(mock_attachment(:save => false))
        post :create, :attachment => {:these => 'params'}
        assigns(:attachment).should equal(mock_attachment)
      end

      it "should re-render the 'new' template" do
        Attachment.stub!(:new).and_return(mock_attachment(:save => false))
        post :create, :attachment => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested attachment" do
        Attachment.should_receive(:find).with("37").and_return(mock_attachment)
        mock_attachment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :attachment => {:these => 'params'}
      end

      it "should expose the requested attachment as @attachment" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => true))
        put :update, :id => "1"
        assigns(:attachment).should equal(mock_attachment)
      end

      it "should redirect to the attachment" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(attachment_url(mock_attachment))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested attachment" do
        Attachment.should_receive(:find).with("37").and_return(mock_attachment)
        mock_attachment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :attachment => {:these => 'params'}
      end

      it "should expose the attachment as @attachment" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => false))
        put :update, :id => "1"
        assigns(:attachment).should equal(mock_attachment)
      end

      it "should re-render the 'edit' template" do
        Attachment.stub!(:find).and_return(mock_attachment(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested attachment" do
      Attachment.should_receive(:find).with("37").and_return(mock_attachment)
      mock_attachment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the attachments list" do
      Attachment.stub!(:find).and_return(mock_attachment(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(attachments_url)
    end

  end

end
