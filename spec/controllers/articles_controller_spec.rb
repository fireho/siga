require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do

  def mock_article(stubs={})
    @mock_article ||= mock_model(Article, stubs)
  end

  describe "When Logged In" do

    before(:each) do
      controller.stub!(:current_user).and_return(:true)
      @login_warning= nil #{}"You need to be logged in to do that"
      autho_login_as :admin

    end

    describe "responding to GET index" do

      it "should expose all articles as @articles" do
        Article.should_receive(:search).with(nil,nil).and_return([mock_article])
        get :index
        assigns[:articles].should == [mock_article]
      end

      describe "with mime type of xml" do

        it "should render all articles as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          Article.should_receive(:search).with(nil,nil).and_return(articles = mock("Array of Articles"))
          articles.should_receive(:to_xml).and_return("generated XML")
          get :index
          response.body.should == "generated XML"
        end

      end

    end

    describe "responding to GET show" do

      it "should expose the requested article as @article" do
        Article.should_receive(:find).with("37").and_return(mock_article)
        get :show, :id => "37"
        assigns[:article].should equal(mock_article)
      end

      describe "with mime type of xml" do

        it "should render the requested article as xml" do
          request.env["HTTP_ACCEPT"] = "application/xml"
          Article.should_receive(:find).with("37").and_return(mock_article)
          mock_article.should_receive(:to_xml).and_return("generated XML")
          get :show, :id => "37"
          response.body.should == "generated XML"
        end

      end

    end

    describe "responding to GET new" do

      it "should expose a new article as @article" do
        Article.should_receive(:new).and_return(mock_article)
        get :new
        assigns[:article].should equal(mock_article)
      end

    end

    describe "responding to GET edit" do

      it "should expose the requested article as @article" do
        Article.should_receive(:find).with("37").and_return(mock_article)
        get :edit, :id => "37"
        assigns[:article].should equal(mock_article)
      end

    end

    describe "responding to POST create" do

      describe "with valid params" do

        it "should expose a newly created article as @article" do
          Article.should_receive(:new).with({'these' => 'params'}).and_return(mock_article(:save => true))
          @mock_article.should_receive(:user=).with(@current_user)
          post :create, :article => {:these => 'params'}
          assigns(:article).should equal(mock_article)
        end

        it "should redirect to the created article" do
          Article.stub!(:new).and_return(mock_article(:save => true))
          @mock_article.should_receive(:user=).with(@current_user)
          post :create, :article => {}
          response.should redirect_to(article_url(mock_article))
        end

      end

      describe "with invalid params" do

        it "should expose a newly created but unsaved article as @article" do
          Article.stub!(:new).with({'these' => 'params'}).and_return(mock_article(:save => false))
          @mock_article.should_receive(:user=).with(@current_user)
          post :create, :article => {:these => 'params'}
          assigns(:article).should equal(mock_article)
        end

        it "should re-render the 'new' template" do
          Article.stub!(:new).and_return(mock_article(:save => false))
          @mock_article.should_receive(:user=).with(@current_user)
          post :create, :article => {}
          response.should render_template('new')
        end

      end

    end

    describe "responding to PUT udpate" do

      describe "with valid params" do

        it "should update the requested article" do
          Article.should_receive(:find).with("37").and_return(mock_article)
          mock_article.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :article => {:these => 'params'}
        end

        it "should expose the requested article as @article" do
          Article.stub!(:find).and_return(mock_article(:update_attributes => true))
          put :update, :id => "1"
          assigns(:article).should equal(mock_article)
        end

        it "should redirect to the article" do
          Article.stub!(:find).and_return(mock_article(:update_attributes => true))
          put :update, :id => "1"
          response.should redirect_to(article_url(mock_article))
        end

      end

      describe "with invalid params" do

        it "should update the requested article" do
          Article.should_receive(:find).with("37").and_return(mock_article)
          mock_article.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, :id => "37", :article => {:these => 'params'}
        end

        it "should expose the article as @article" do
          Article.stub!(:find).and_return(mock_article(:update_attributes => false))
          put :update, :id => "1"
          assigns(:article).should equal(mock_article)
        end

        it "should re-render the 'edit' template" do
          Article.stub!(:find).and_return(mock_article(:update_attributes => false))
          put :update, :id => "1"
          response.should render_template('edit')
        end

      end

    end

    describe "responding to DELETE destroy" do

      it "should destroy the requested article" do
        Article.should_receive(:find).with("37").and_return(mock_article)
        mock_article.should_receive(:destroy)
        delete :destroy, :id => "37"
      end

      it "should redirect to the articles list" do
        Article.stub!(:find).and_return(mock_article(:destroy => true))
        delete :destroy, :id => "1"
        response.should redirect_to(articles_url)
      end

    end

  end
end
