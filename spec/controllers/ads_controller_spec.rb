require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdsController do

  def mock_ad(stubs={})
    @mock_ad ||= mock_model(Ad, stubs)
  end
  
  describe "GET index" do

    it "exposes all ads as @ads" do
      Ad.should_receive(:find).with(:all).and_return([mock_ad])
      get :index
      assigns[:ads].should == [mock_ad]
    end

    describe "with mime type of xml" do
  
      it "renders all ads as xml" do
        Ad.should_receive(:find).with(:all).and_return(ads = mock("Array of Ads"))
        ads.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "GET show" do

    it "exposes the requested ad as @ad" do
      Ad.should_receive(:find).with("37").and_return(mock_ad)
      get :show, :id => "37"
      assigns[:ad].should equal(mock_ad)
    end
    
    describe "with mime type of xml" do

      it "renders the requested ad as xml" do
        Ad.should_receive(:find).with("37").and_return(mock_ad)
        mock_ad.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37", :format => 'xml'
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "GET new" do
  
    it "exposes a new ad as @ad" do
      Ad.should_receive(:new).and_return(mock_ad)
      get :new
      assigns[:ad].should equal(mock_ad)
    end

  end

  describe "GET edit" do
  
    it "exposes the requested ad as @ad" do
      Ad.should_receive(:find).with("37").and_return(mock_ad)
      get :edit, :id => "37"
      assigns[:ad].should equal(mock_ad)
    end

  end

  describe "POST create" do

    describe "with valid params" do
      
      it "exposes a newly created ad as @ad" do
        Ad.should_receive(:new).with({'these' => 'params'}).and_return(mock_ad(:save => true))
        post :create, :ad => {:these => 'params'}
        assigns(:ad).should equal(mock_ad)
      end

      it "redirects to the created ad" do
        Ad.stub!(:new).and_return(mock_ad(:save => true))
        post :create, :ad => {}
        response.should redirect_to(ad_url(mock_ad))
      end
      
    end
    
    describe "with invalid params" do

      it "exposes a newly created but unsaved ad as @ad" do
        Ad.stub!(:new).with({'these' => 'params'}).and_return(mock_ad(:save => false))
        post :create, :ad => {:these => 'params'}
        assigns(:ad).should equal(mock_ad)
      end

      it "re-renders the 'new' template" do
        Ad.stub!(:new).and_return(mock_ad(:save => false))
        post :create, :ad => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "PUT udpate" do

    describe "with valid params" do

      it "updates the requested ad" do
        Ad.should_receive(:find).with("37").and_return(mock_ad)
        mock_ad.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ad => {:these => 'params'}
      end

      it "exposes the requested ad as @ad" do
        Ad.stub!(:find).and_return(mock_ad(:update_attributes => true))
        put :update, :id => "1"
        assigns(:ad).should equal(mock_ad)
      end

      it "redirects to the ad" do
        Ad.stub!(:find).and_return(mock_ad(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(ad_url(mock_ad))
      end

    end
    
    describe "with invalid params" do

      it "updates the requested ad" do
        Ad.should_receive(:find).with("37").and_return(mock_ad)
        mock_ad.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ad => {:these => 'params'}
      end

      it "exposes the ad as @ad" do
        Ad.stub!(:find).and_return(mock_ad(:update_attributes => false))
        put :update, :id => "1"
        assigns(:ad).should equal(mock_ad)
      end

      it "re-renders the 'edit' template" do
        Ad.stub!(:find).and_return(mock_ad(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "DELETE destroy" do

    it "destroys the requested ad" do
      Ad.should_receive(:find).with("37").and_return(mock_ad)
      mock_ad.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the ads list" do
      Ad.stub!(:find).and_return(mock_ad(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(ads_url)
    end

  end

end
