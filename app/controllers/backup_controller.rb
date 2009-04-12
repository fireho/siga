class BackupController < ApplicationController
  layout false

  def index
    files = Dir['tmp/*.bz2'].sort.reverse
    @backups = files.map do |f|
      { :name => f.gsub(/\D|2$/, ""), :size => File.size(f)}
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => 'OK' }
    end
  end

  def show
    f = find_file(params[:id])
    send_file(f, :filename => f.gsub(/tmp\//, ""))
  end

  def new
    cmd = system("rake db:backup")

    respond_to do |format|
      flash[:notice] = 'Backup concluido.'
      format.html  {  redirect_to(admin_index_url + "#backup") }
      format.xml  { render :xml => 'OK' }
    end
  end

  def destroy
    f = find_file(params[:id])
    File.delete(f)

    respond_to do |format|
      flash[:notice] = 'Backup apagado.'
      format.html { redirect_to(admin_index_url) }
      format.xml  { head :ok }
    end
  end

  def create
    uploaded_io = params[:backup][:file]

    File.open(Rails.root.join('tmp',  uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end

    respond_to do |format|
      flash[:notice] = 'Backup recebido.'
      format.html { redirect_to(admin_index_url) }
      format.xml  { head :ok }
    end

  end

  def restore
    f = find_file(params[:id])
    send_file(f, :filename => f.gsub(/tmp\//, ""))

    respond_to do |format|
      flash[:notice] = 'Backup restaurado.'
      format.html { redirect_to(admin_index_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_file(file)
    Dir['tmp/*.bz2'].select { |f| f =~ /#{file}/ }.first
  end

end
