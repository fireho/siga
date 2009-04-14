require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PeopleController do

  def mock_person(stubs={})
    @mock_person ||= mock_model(Person, stubs)
  end

    describe "When Logged In" do

    before(:each) do
      @login_warning= nil #{}"You need to be logged in to do that"
      autho_login_as :admin
    end

  describe "GET index" do

    it "exposes all people as @people" do
      Person.should_receive(:search).with(nil, nil).and_return([mock_person])
      get :index
      assigns[:people].should == [mock_person]
    end

    describe "with mime type of xml" do

      it "renders all people as xml" do
        Person.should_receive(:search).with(nil, nil).and_return(people = mock("Array of People"))
        people.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET show" do

    it "exposes the requested person as @person" do
      Person.should_receive(:find).with("37").and_return(mock_person)
      get :show, :id => "37"
      assigns[:person].should equal(mock_person)
    end

    describe "with mime type of xml" do

      it "renders the requested person as xml" do
        Person.should_receive(:find).with("37").and_return(mock_person)
        mock_person.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  describe "GET new" do

    it "exposes a new person as @person" do
      Person.should_receive(:new).and_return(mock_person)
      get :new
      assigns[:person].should equal(mock_person)
    end

  end

  describe "GET edit" do

    it "exposes the requested person as @person" do
      Person.should_receive(:find).with("37").and_return(mock_person)
      get :edit, :id => "37"
      assigns[:person].should equal(mock_person)
    end

  end

  describe "POST create" do

    describe "with valid params" do

      it "exposes a newly created person as @person" do
        Person.should_receive(:new).with({'these' => 'params'}).and_return(mock_person(:save => true))
        post :create, :person => {:these => 'params'}
        assigns(:person).should equal(mock_person)
      end

      it "redirects to the created person" do
        Person.stub!(:new).and_return(mock_person(:save => true))
        post :create, :person => {}
        response.should redirect_to(person_url(mock_person))
      end

    end

    describe "with invalid params" do

      it "exposes a newly created but unsaved person as @person" do
        Person.stub!(:new).with({'these' => 'params'}).and_return(mock_person(:save => false))
        post :create, :person => {:these => 'params'}
        assigns(:person).should equal(mock_person)
      end

      it "re-renders the 'new' template" do
        Person.stub!(:new).and_return(mock_person(:save => false))
        post :create, :person => {}
        response.should render_template('new')
      end

    end

  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested person" do
        Person.should_receive(:find).with("37").and_return(mock_person)
        mock_person.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :person => {:these => 'params'}
      end

      it "exposes the requested person as @person" do
        Person.stub!(:find).and_return(mock_person(:update_attributes => true))
        put :update, :id => "1"
        assigns(:person).should equal(mock_person)
      end

      it "redirects to the person" do
        Person.stub!(:find).and_return(mock_person(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(person_url(mock_person))
      end

    end

    describe "with invalid params" do

      it "updates the requested person" do
        Person.should_receive(:find).with("37").and_return(mock_person)
        mock_person.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :person => {:these => 'params'}
      end

      it "exposes the person as @person" do
        Person.stub!(:find).and_return(mock_person(:update_attributes => false))
        put :update, :id => "1"
        assigns(:person).should equal(mock_person)
      end

      it "re-renders the 'edit' template" do
        Person.stub!(:find).and_return(mock_person(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested person" do
      Person.should_receive(:find).with("37").and_return(mock_person)
      mock_person.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the people list" do
      Person.stub!(:find).and_return(mock_person(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(people_url)
    end

  end

end
end
