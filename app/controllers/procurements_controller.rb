class ProcurementsController < ApplicationController
  # GET /procurements
  # GET /procurements.xml
  def index
    @procurements = Procurement.search(params[:filter], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @procurements }
    end
  end

  # GET /procurements/1
  # GET /procurements/1.xml
  def show
    @procurement = Procurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @procurement }
    end
  end

  # GET /procurements/new
  # GET /procurements/new.xml
  def new
    @procurement = Procurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @procurement }
    end
  end

  # GET /procurements/1/edit
  def edit
    @procurement = Procurement.find(params[:id])
  end

  # POST /procurements
  # POST /procurements.xml
  def create
    @procurement = Procurement.new(params[:procurement])

    respond_to do |format|
      if @procurement.save
        flash[:notice] = 'Procurement was successfully created.'
        format.html { redirect_to(@procurement) }
        format.xml  { render :xml => @procurement, :status => :created, :location => @procurement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @procurement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /procurements/1
  # PUT /procurements/1.xml
  def update
    @procurement = Procurement.find(params[:id])

    respond_to do |format|
      if @procurement.update_attributes(params[:procurement])
        flash[:notice] = 'Procurement was successfully updated.'
        format.html { redirect_to(@procurement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @procurement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /procurements/1
  # DELETE /procurements/1.xml
  def destroy
    @procurement = Procurement.find(params[:id])
    @procurement.destroy

    respond_to do |format|
      format.html { redirect_to(procurements_url) }
      format.xml  { head :ok }
    end
  end
end
