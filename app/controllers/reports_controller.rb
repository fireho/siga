class ReportsController < ApplicationController
  layout 'siga'

  before_filter :authenticate, :destroy

  # GET /reports
  # GET /reports.xml
  def index
    @reports = Report.find(:all, :conditions => ["usuario = ?", session_user[:login]], :order => 'created_at desc')

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
  def show
    @mostra_rel = Report.find(params[:id])

    respond_to do |format|
     format.pdf {send_file @mostra_rel.caminho, :inline => true, :type => "application/pdf" }
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @tot_reg = Report.count(:conditions => ["usuario = ?", session_user[:login]])
    if @tot_reg > 10
      @filepath = Report.find(:first, :conditions => ["usuario = ?", session_user[:login]])
      File.delete(@filepath.caminho)
      Report.find(:first, :conditions => ["usuario = ?", session_user[:login]]).destroy
    end
  end
end
