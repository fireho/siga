require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MediasController do

  def mock_media(stubs={})
    @mock_media ||= mock_model(Media, stubs)
  end

  describe "responding to GET index" do

    it "should expose all medias as @medias" do
      Media.should_receive(:search).with(nil,nil).and_return([mock_media])
      get :index
      assigns[:medias].should == [mock_media]
    end

    describe "with mime type of xml" do

      it "should render all medias as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Media.should_receive(:search).with(nil,nil).and_return(medias = mock("Array of Medias"))
        medias.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end

    end

  end

  describe "responding to GET show" do

    it "should expose the requested media as @media" do
      Media.should_receive(:find).with("37").and_return(mock_media)
      get :show, :id => "37"
      assigns[:media].should equal(mock_media)
    end

    describe "with mime type of xml" do

      it "should render the requested media as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Media.should_receive(:find).with("37").and_return(mock_media)
        mock_media.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end

  end

  describe "responding to GET new" do

    it "should expose a new media as @media" do
      Media.should_receive(:new).and_return(mock_media)
      get :new
      assigns[:media].should equal(mock_media)
    end

  end

  describe "responding to GET edit" do

    it "should expose the requested media as @media" do
      Media.should_receive(:find).with("37").and_return(mock_media)
      get :edit, :id => "37"
      assigns[:media].should equal(mock_media)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do

      it "should expose a newly created media as @media" do
        Media.should_receive(:new).with({'these' => 'params'}).and_return(mock_media(:save => true))
        post :create, :media => {:these => 'params'}
        assigns(:media).should equal(mock_media)
      end

      it "should redirect to the created media" do
        Media.stub!(:new).and_return(mock_media(:save => true))
        post :create, :media => {}
        response.should redirect_to(media_url(mock_media))
      end

    end

    describe "with invalid params" do

      it "should expose a newly created but unsaved media as @media" do
        Media.stub!(:new).with({'these' => 'params'}).and_return(mock_media(:save => false))
        post :create, :media => {:these => 'params'}
        assigns(:media).should equal(mock_media)
      end

      it "should re-render the 'new' template" do
        Media.stub!(:new).and_return(mock_media(:save => false))
        post :create, :media => {}
        response.should render_template('new')
      end

    end

  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested media" do
        Media.should_receive(:find).with("37").and_return(mock_media)
        mock_media.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :media => {:these => 'params'}
      end

      it "should expose the requested media as @media" do
        Media.stub!(:find).and_return(mock_media(:update_attributes => true))
        put :update, :id => "1"
        assigns(:media).should equal(mock_media)
      end

      it "should redirect to the media" do
        Media.stub!(:find).and_return(mock_media(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(media_url(mock_media))
      end

    end

    describe "with invalid params" do

      it "should update the requested media" do
        Media.should_receive(:find).with("37").and_return(mock_media)
        mock_media.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :media => {:these => 'params'}
      end

      it "should expose the media as @media" do
        Media.stub!(:find).and_return(mock_media(:update_attributes => false))
        put :update, :id => "1"
        assigns(:media).should equal(mock_media)
      end

      it "should re-render the 'edit' template" do
        Media.stub!(:find).and_return(mock_media(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested media" do
      Media.should_receive(:find).with("37").and_return(mock_media)
      mock_media.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "should redirect to the medias list" do
      Media.stub!(:find).and_return(mock_media(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(medias_url)
    end

  end

end
