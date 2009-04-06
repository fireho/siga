class ProfessionsController < ApplicationController
  # GET /professions
  # GET /professions.xml
  def index
    @professions = Profession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @professions }
    end
  end

  # GET /professions/1
  # GET /professions/1.xml
  def show
    @profession = Profession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profession }
    end
  end

  # GET /professions/new
  # GET /professions/new.xml
  def new
    @profession = Profession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profession }
    end
  end

  # GET /professions/1/edit
  def edit
    @profession = Profession.find(params[:id])
  end

  # POST /professions
  # POST /professions.xml
  def create
    @profession = Profession.new(params[:profession])

    respond_to do |format|
      if @profession.save
        flash[:notice] = 'Profession was successfully created.'
        format.html { redirect_to(@profession) }
        format.xml  { render :xml => @profession, :status => :created, :location => @profession }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profession.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /professions/1
  # PUT /professions/1.xml
  def update
    @profession = Profession.find(params[:id])

    respond_to do |format|
      if @profession.update_attributes(params[:profession])
        flash[:notice] = 'Profession was successfully updated.'
        format.html { redirect_to(@profession) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profession.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /professions/1
  # DELETE /professions/1.xml
  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy

    respond_to do |format|
      format.html { redirect_to(professions_url) }
      format.xml  { head :ok }
    end
  end
end
