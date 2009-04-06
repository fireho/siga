require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AnimalsController do

  def mock_animal(stubs={})
    @mock_animal ||= mock_model(Animal, stubs)
  end
  
  describe "GET index" do

    it "exposes all animals as @animals" do
      Animal.should_receive(:find).with(:all).and_return([mock_animal])
      get :index
      assigns[:animals].should == [mock_animal]
    end

    describe "with mime type of xml" do
  
      it "renders all animals as xml" do
        Animal.should_receive(:find).with(:all).and_return(animals = mock("Array of Animals"))
        animals.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested animal as @animal" do
      Animal.should_receive(:find).with("37").and_return(mock_animal)
      get :show, :id => "37"
      assigns[:animal].should equal(mock_animal)
    end
    
    describe "with mime type of xml" do

      it "renders the requested animal as xml" do
        Animal.should_receive(:find).with("37").and_return(mock_animal)
        mock_animal.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new animal as @animal" do
      Animal.should_receive(:new).and_return(mock_animal)
      get :new
      assigns[:animal].should equal(mock_animal)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested animal as @animal" do
      Animal.should_receive(:find).with("37").and_return(mock_animal)
      get :edit, :id => "37"
      assigns[:animal].should equal(mock_animal)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created animal as @animal" do
        Animal.should_receive(:new).with({'these' => 'params'}).and_return(mock_animal(:save => true))
        post :create, :animal => {:these => 'params'}
        assigns(:animal).should equal(mock_animal)
      end

      it "redirects to the created animal" do
        Animal.stub!(:new).and_return(mock_animal(:save => true))
        post :create, :animal => {}
        response.should redirect_to(animal_url(mock_animal))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved animal as @animal" do
        Animal.stub!(:new).with({'these' => 'params'}).and_return(mock_animal(:save => false))
        post :create, :animal => {:these => 'params'}
        assigns(:animal).should equal(mock_animal)
      end

      it "re-renders the 'new' template" do
        Animal.stub!(:new).and_return(mock_animal(:save => false))
        post :create, :animal => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested animal" do
        Animal.should_receive(:find).with("37").and_return(mock_animal)
        mock_animal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :animal => {:these => 'params'}
      end

      it "exposes the requested animal as @animal" do
        Animal.stub!(:find).and_return(mock_animal(:update_attributes => true))
        put :update, :id => "1"
        assigns(:animal).should equal(mock_animal)
      end

      it "redirects to the animal" do
        Animal.stub!(:find).and_return(mock_animal(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(animal_url(mock_animal))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested animal" do
        Animal.should_receive(:find).with("37").and_return(mock_animal)
        mock_animal.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :animal => {:these => 'params'}
      end

      it "exposes the animal as @animal" do
        Animal.stub!(:find).and_return(mock_animal(:update_attributes => false))
        put :update, :id => "1"
        assigns(:animal).should equal(mock_animal)
      end

      it "re-renders the 'edit' template" do
        Animal.stub!(:find).and_return(mock_animal(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested animal" do
      Animal.should_receive(:find).with("37").and_return(mock_animal)
      mock_animal.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the animals list" do
      Animal.stub!(:find).and_return(mock_animal(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(animals_url)
    end

  end

end
