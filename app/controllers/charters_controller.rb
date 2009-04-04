class ChartersController < ApplicationController
  # GET /charters
  # GET /charters.xml
  def index
    @charters = Charter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charters }
    end
  end

  # GET /charters/1
  # GET /charters/1.xml
  def show
    @charter = Charter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @charter }
    end
  end

  # GET /charters/new
  # GET /charters/new.xml
  def new
    @charter = Charter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @charter }
    end
  end

  # GET /charters/1/edit
  def edit
    @charter = Charter.find(params[:id])
  end

  # POST /charters
  # POST /charters.xml
  def create
    @charter = Charter.new(params[:charter])

    respond_to do |format|
      if @charter.save
        flash[:notice] = 'Charter was successfully created.'
        format.html { redirect_to(@charter) }
        format.xml  { render :xml => @charter, :status => :created, :location => @charter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @charter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charters/1
  # PUT /charters/1.xml
  def update
    @charter = Charter.find(params[:id])

    respond_to do |format|
      if @charter.update_attributes(params[:charter])
        flash[:notice] = 'Charter was successfully updated.'
        format.html { redirect_to(@charter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @charter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /charters/1
  # DELETE /charters/1.xml
  def destroy
    @charter = Charter.find(params[:id])
    @charter.destroy

    respond_to do |format|
      format.html { redirect_to(charters_url) }
      format.xml  { head :ok }
    end
  end
end
