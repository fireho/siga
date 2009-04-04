require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MessagesController do

  def mock_message(stubs={})
    @mock_message ||= mock_model(Message, stubs)
  end

  describe "When Logged In" do

    before(:each) do
      @login_warning= nil #{}"You need to be logged in to do that"
      autho_login_as :admin
    end

    describe "responding to GET index" do

      it "should expose all messages as @messages" do
        @current_user.should_receive(:messages).and_return(mock_message)
        @mock_message.should_receive(:all).and_return([mock_message])
        get :index
        assigns[:messages].should == [mock_message]
      end

      describe "with mime type of xml" do

        it "should render all messages as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          @current_user.should_receive(:messages).and_return(mock_message)
          @mock_message.should_receive(:all).and_return(mock_message)
          @mock_message.should_receive(:to_xml).and_return("generated XML")
          get :index
          response.body.should == "generated XML"
        end

      end

    end

    describe "responding to GET show" do

      before(:each) do
        @current_user.should_receive(:messages).and_return(mock_message)
        @mock_message.should_receive(:find).with("37").and_return(mock_message)
        @mock_message.should_receive(:read!).and_return(true)
      end

      it "should expose the requested message as @message" do
        get :show, :id => "37"
        assigns[:message].should equal(mock_message)
      end

      describe "with mime type of xml" do

        it "should render the requested message as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          @mock_message.should_receive(:to_xml).and_return("generated XML")
          get :show, :id => "37"
          response.body.should == "generated XML"
        end

      end

    end

    describe "responding to GET new" do

      it "should expose a new message as @message" do
        @current_user.stub!(:users).and_return([])
        Message.should_receive(:new).and_return(mock_message)
        get :new
        assigns[:message].should equal(mock_message)
      end

    end

    describe "responding to POST create" do

      before(:each) do
          @current_user.stub!(:users).and_return([])
        @current_user.should_receive(:messages_sent).and_return(mock_message)
      end

      describe "with valid params" do

        it "should expose a newly created message as @message" do
          @mock_message.should_receive(:build).with({'these' => 'params'}).and_return(m = mock_model(Message, :save => true))
          post :create, :message => {:these => 'params'}
          assigns(:message).should equal(m)
        end

        it "should redirect to the inbox" do
          @mock_message.stub!(:build).and_return(m = mock_model(Message, :save => true))
          post :create, :message => {}
          response.should redirect_to(inbox_path)
        end

      end

      describe "with invalid params" do

        it "should expose a newly created but unsaved message as @message" do
          @mock_message.should_receive(:build).with({'these' => 'params'}).and_return(m = mock_model(Message, :save => false))
          post :create, :message => {:these => 'params'}
          assigns(:message).should equal(m)
        end

        it "should re-render the 'new' template" do
          @mock_message.stub!(:build).and_return(m = mock_model(Message, :save => false))
          post :create, :message => {}
          response.should render_template('new')
        end

      end

    end


    describe "responding to DELETE destroy" do

      it "should destroy the requested message" do
        Message.should_receive(:find).with("37").and_return(mock_message)
        mock_message.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "should redirect to the messages list" do
        Message.stub!(:find).and_return(mock_message(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(messages_url)
      end

    end

  end
end
