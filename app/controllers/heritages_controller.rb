class HeritagesController < ApplicationController
  # GET /heritages
  # GET /heritages.xml
  def index
    @heritages = Heritage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @heritages }
    end
  end

  # GET /heritages/1
  # GET /heritages/1.xml
  def show
    @heritage = Heritage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @heritage }
    end
  end

  # GET /heritages/new
  # GET /heritages/new.xml
  def new
    @heritage = Heritage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @heritage }
    end
  end

  # GET /heritages/1/edit
  def edit
    @heritage = Heritage.find(params[:id])
  end

  # POST /heritages
  # POST /heritages.xml
  def create
    @heritage = Heritage.new(params[:heritage])

    respond_to do |format|
      if @heritage.save
        flash[:notice] = 'Heritage was successfully created.'
        format.html { redirect_to(@heritage) }
        format.xml  { render :xml => @heritage, :status => :created, :location => @heritage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @heritage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /heritages/1
  # PUT /heritages/1.xml
  def update
    @heritage = Heritage.find(params[:id])

    respond_to do |format|
      if @heritage.update_attributes(params[:heritage])
        flash[:notice] = 'Heritage was successfully updated.'
        format.html { redirect_to(@heritage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @heritage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /heritages/1
  # DELETE /heritages/1.xml
  def destroy
    @heritage = Heritage.find(params[:id])
    @heritage.destroy

    respond_to do |format|
      format.html { redirect_to(heritages_url) }
      format.xml  { head :ok }
    end
  end
end
