require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CalendarsController do

  def mock_calendar(stubs={})
    @mock_calendar ||= mock_model(Calendar, stubs)
  end
  
  describe "GET index" do

    it "exposes all calendars as @calendars" do
      Calendar.should_receive(:find).with(:all).and_return([mock_calendar])
      get :index
      assigns[:calendars].should == [mock_calendar]
    end

    describe "with mime type of xml" do
  
      it "renders all calendars as xml" do
        Calendar.should_receive(:find).with(:all).and_return(calendars = mock("Array of Calendars"))
        calendars.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested calendar as @calendar" do
      Calendar.should_receive(:find).with("37").and_return(mock_calendar)
      get :show, :id => "37"
      assigns[:calendar].should equal(mock_calendar)
    end
    
    describe "with mime type of xml" do

      it "renders the requested calendar as xml" do
        Calendar.should_receive(:find).with("37").and_return(mock_calendar)
        mock_calendar.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new calendar as @calendar" do
      Calendar.should_receive(:new).and_return(mock_calendar)
      get :new
      assigns[:calendar].should equal(mock_calendar)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested calendar as @calendar" do
      Calendar.should_receive(:find).with("37").and_return(mock_calendar)
      get :edit, :id => "37"
      assigns[:calendar].should equal(mock_calendar)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created calendar as @calendar" do
        Calendar.should_receive(:new).with({'these' => 'params'}).and_return(mock_calendar(:save => true))
        post :create, :calendar => {:these => 'params'}
        assigns(:calendar).should equal(mock_calendar)
      end

      it "redirects to the created calendar" do
        Calendar.stub!(:new).and_return(mock_calendar(:save => true))
        post :create, :calendar => {}
        response.should redirect_to(calendar_url(mock_calendar))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved calendar as @calendar" do
        Calendar.stub!(:new).with({'these' => 'params'}).and_return(mock_calendar(:save => false))
        post :create, :calendar => {:these => 'params'}
        assigns(:calendar).should equal(mock_calendar)
      end

      it "re-renders the 'new' template" do
        Calendar.stub!(:new).and_return(mock_calendar(:save => false))
        post :create, :calendar => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested calendar" do
        Calendar.should_receive(:find).with("37").and_return(mock_calendar)
        mock_calendar.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :calendar => {:these => 'params'}
      end

      it "exposes the requested calendar as @calendar" do
        Calendar.stub!(:find).and_return(mock_calendar(:update_attributes => true))
        put :update, :id => "1"
        assigns(:calendar).should equal(mock_calendar)
      end

      it "redirects to the calendar" do
        Calendar.stub!(:find).and_return(mock_calendar(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(calendar_url(mock_calendar))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested calendar" do
        Calendar.should_receive(:find).with("37").and_return(mock_calendar)
        mock_calendar.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :calendar => {:these => 'params'}
      end

      it "exposes the calendar as @calendar" do
        Calendar.stub!(:find).and_return(mock_calendar(:update_attributes => false))
        put :update, :id => "1"
        assigns(:calendar).should equal(mock_calendar)
      end

      it "re-renders the 'edit' template" do
        Calendar.stub!(:find).and_return(mock_calendar(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested calendar" do
      Calendar.should_receive(:find).with("37").and_return(mock_calendar)
      mock_calendar.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the calendars list" do
      Calendar.stub!(:find).and_return(mock_calendar(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(calendars_url)
    end

  end

end
