class ProvincesController < ApplicationController
  # GET /provinces
  # GET /provinces.xml
  def index
    @provinces = Province.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @provinces }
    end
  end

  # GET /provinces/1
  # GET /provinces/1.xml
  def show
    @province = Province.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @province }
    end
  end

  # GET /provinces/new
  # GET /provinces/new.xml
  def new
    @province = Province.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @province }
    end
  end

  # GET /provinces/1/edit
  def edit
    @province = Province.find(params[:id])
  end

  # POST /provinces
  # POST /provinces.xml
  def create
    @province = Province.new(params[:province])

    respond_to do |format|
      if @province.save
        flash[:notice] = 'Province was successfully created.'
        format.html { redirect_to(@province) }
        format.xml  { render :xml => @province, :status => :created, :location => @province }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @province.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /provinces/1
  # PUT /provinces/1.xml
  def update
    @province = Province.find(params[:id])

    respond_to do |format|
      if @province.update_attributes(params[:province])
        flash[:notice] = 'Province was successfully updated.'
        format.html { redirect_to(@province) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @province.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /provinces/1
  # DELETE /provinces/1.xml
  def destroy
    @province = Province.find(params[:id])
    @province.destroy

    respond_to do |format|
      format.html { redirect_to(provinces_url) }
      format.xml  { head :ok }
    end
  end
end
