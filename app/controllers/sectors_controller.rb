class SectorsController < ApplicationController

  layout 'siga'

  # GET /sectors
  # GET /sectors.xml
  def index
  end

  # GET /sectors/1
  # GET /sectors/1.xml
  def show
    @sectors = Sector.search(params[:pesquisar], params[:page])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /sectors/new
  # GET /sectors/new.xml
  def new
    @sector = Sector.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /sectors/1/edit
  def edit
    @sector = Sector.find(params[:id])
  end

  # POST /sectors
  # POST /sectors.xml
  def create
    @sector = Sector.new(params[:sector])

    respond_to do |format|
      if @sector.save
        flash[:notice] = 'Setor criado com sucesso.'
        format.html { render :action => 'index' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /sectors/1
  # PUT /sectors/1.xml
  def update
    @sector = Sector.find(params[:id])

    respond_to do |format|
      if @sector.update_attributes(params[:sector])
        flash[:notice] = 'Setor alterado com sucesso.'
        format.html { redirect_to :action => 'index' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.xml
  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy

    respond_to do |format|
      flash[:notice] = 'Setor excluído com sucesso.'
      format.html { redirect_to(sectors_url) }
    end
  end
end
