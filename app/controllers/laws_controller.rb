class LawsController < ApplicationController
  # GET /laws
  # GET /laws.xml
  def index
    @laws = Law.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laws }
    end
  end

  # GET /laws/1
  # GET /laws/1.xml
  def show
    @law = Law.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @law }
    end
  end

  # GET /laws/new
  # GET /laws/new.xml
  def new
    @law = Law.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @law }
    end
  end

  # GET /laws/1/edit
  def edit
    @law = Law.find(params[:id])
  end

  # POST /laws
  # POST /laws.xml
  def create
    @law = Law.new(params[:law])

    respond_to do |format|
      if @law.save
        flash[:notice] = 'Law was successfully created.'
        format.html { redirect_to(@law) }
        format.xml  { render :xml => @law, :status => :created, :location => @law }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @law.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laws/1
  # PUT /laws/1.xml
  def update
    @law = Law.find(params[:id])

    respond_to do |format|
      if @law.update_attributes(params[:law])
        flash[:notice] = 'Law was successfully updated.'
        format.html { redirect_to(@law) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @law.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laws/1
  # DELETE /laws/1.xml
  def destroy
    @law = Law.find(params[:id])
    @law.destroy

    respond_to do |format|
      format.html { redirect_to(laws_url) }
      format.xml  { head :ok }
    end
  end
end
