require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminController do

  def mock_opt(stubs={})
    @mock_opt ||= mock_model(Opt, stubs)
  end

  describe "GET index" do

    it "exposes all opts as @opts" do
      Opt.should_receive(:find).with(:all).and_return([mock_opt])
      get :index
      assigns[:opts].should == [mock_opt]
    end

    describe "with mime type of xml" do

      it "renders all opts as xml" do
        Opt.should_receive(:find).with(:all).and_return(opts = mock("Array of Opts"))
        opts.should_receive(:to_xml).and_return("generated XML")
        get :index, :format => 'xml'
        response.body.should == "generated XML"
      end

    end

  end

  # describe "PUT udpate" do

  #   describe "with valid params" do

  #     it "updates the requested opt" do
  #       Opt.should_receive(:find).with("37").and_return(mock_opt)
  #       mock_opt.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :opt => {:these => 'params'}
  #     end

  #     it "exposes the requested opt as @opt" do
  #       Opt.stub!(:find).and_return(mock_opt(:update_attributes => true))
  #       put :update, :id => "1"
  #       assigns(:opt).should equal(mock_opt)
  #     end

  #     it "redirects to the opt" do
  #       Opt.stub!(:find).and_return(mock_opt(:update_attributes => true))
  #       put :update, :id => "1"
  #       response.should redirect_to(opt_url(mock_opt))
  #     end

  #   end

  #   describe "with invalid params" do

  #     it "updates the requested opt" do
  #       Opt.should_receive(:find).with("37").and_return(mock_opt)
  #       mock_opt.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :opt => {:these => 'params'}
  #     end

  #     it "exposes the opt as @opt" do
  #       Opt.stub!(:find).and_return(mock_opt(:update_attributes => false))
  #       put :update, :id => "1"
  #       assigns(:opt).should equal(mock_opt)
  #     end

  #     it "re-renders the 'edit' template" do
  #       Opt.stub!(:find).and_return(mock_opt(:update_attributes => false))
  #       put :update, :id => "1"
  #       response.should render_template('edit')
  #     end

  #   end

  # end

end
