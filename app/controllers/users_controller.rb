class UsersController < ApplicationController

  layout 'siga'

  before_filter :access_adm, :except => [:show_password, :update_password]

  # GET /users
  # GET /users.xml
  def index
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @users = User.search(params[:pesquisar], params[:page])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Usuário cadastrado com sucesso.'
        format.html { render :action => 'index' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Usuário alterado com sucesso.'
        format.html { redirect_to :action => 'index' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      flash[:notice] = 'Usuário removido com sucesso.'
      format.html { redirect_to(users_url) }
    end
  end

  def show_password
    @user = User.find(:first, :conditions => ["login = ?", session_user[:login]])
    respond_to do |format|
      format.html # show_password.html.erb
    end
  end

  def update_password
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Senha alterada com sucesso.'
        format.html { redirect_to :action => 'index' }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
