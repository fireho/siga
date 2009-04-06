class OfficialsController < ApplicationController
  # GET /officials
  # GET /officials.xml
  def index
    @officials = Official.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @officials }
    end
  end

  # GET /officials/1
  # GET /officials/1.xml
  def show
    @official = Official.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @official }
    end
  end

  # GET /officials/new
  # GET /officials/new.xml
  def new
    @official = Official.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @official }
    end
  end

  # GET /officials/1/edit
  def edit
    @official = Official.find(params[:id])
  end

  # POST /officials
  # POST /officials.xml
  def create
    @official = Official.new(params[:official])

    respond_to do |format|
      if @official.save
        flash[:notice] = 'Official was successfully created.'
        format.html { redirect_to(@official) }
        format.xml  { render :xml => @official, :status => :created, :location => @official }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @official.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /officials/1
  # PUT /officials/1.xml
  def update
    @official = Official.find(params[:id])

    respond_to do |format|
      if @official.update_attributes(params[:official])
        flash[:notice] = 'Official was successfully updated.'
        format.html { redirect_to(@official) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @official.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /officials/1
  # DELETE /officials/1.xml
  def destroy
    @official = Official.find(params[:id])
    @official.destroy

    respond_to do |format|
      format.html { redirect_to(officials_url) }
      format.xml  { head :ok }
    end
  end
end
