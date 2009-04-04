class RelAdmController < ApplicationController

   layout 'sgp'

  require 'rubygems'
  require 'rghost'
  include RGhost

  RGhost::Config::GS[:path]='/usr/bin/gs'
  RGhost::Config::GS[:mode]= :gsparams
  RGhost::Config::GS[:tmpdir]= '/tmp'
  #RGhost::Config::GS[:charset_convert]= lambda {|text| Iconv::iconv('utf8','latin1', text).to_s}
  RGhost::Config::GS[:stack_elements]= 5000

  Local_rel = "#{RAILS_ROOT}/public/Relatorios/"

   # Relatório de Setores
  def rel_sectors
    n_rel = 'Setores'
    d_rel = DateTime.now
    param_rel = d_rel.strftime("%d%m%y%H%M%S")
    usuario = session_user.login
    arq_rel = n_rel << param_rel << session_user.login

    rel = Document.new(:paper => :A4, :landscape => false, :row_per_pages => 60, :margin_top => 3.5)

    rel.before_page_create do
    set Eps.new("#{RAILS_ROOT}/public/images/siga.eps")
    text_in :x=> 8, :y=> 26.5, :text => "RELATÓRIO DE SETORES", :tag => :h1
    text_in :x=> 18.5, :y=> 27.5, :text =>  "Página:  %current_page%"
    text_in :x=> 5, :y=> 1.2, :text => "Emitido por SIG@ - Sistema de Gestão @dministrativa em " <<  d_rel.strftime("%d/%m/%Y - %H:%M:%S") << ' - ' << usuario
  end

  rel.rails_grid :style => :border_lines, :align => :center, :width => 17 do |grid|
      grid.column :id, :title => "CÓD", :align => :center, :width => 1.5
      grid.column :setor, :title => "SETOR", :align => :left, :width => 10, :title_align => :center
      grid.column :responsavel, :title => "RESPONSÁVEL", :align => :left, :width => 7.5, :title_align => :center
      grid.data Sector.find(:all, :limit => 1000)
    end

    rel.render :pdf, :filename => "#{RAILS_ROOT}/public/Relatorios/#{arq_rel}.pdf"
    conn = ActiveRecord::Base.connection
    conn.execute "INSERT INTO reports (relatorio, caminho, created_at, usuario) VALUES ('Setores', '#{Local_rel}#{n_rel}.pdf', '#{d_rel}', '#{session_user.login}')"
    redirect_to :controller => 'reports', :action => 'index'
  end

  # Relatório de Usuários
  def rel_users
    n_rel = 'Usuários'
    d_rel = DateTime.now
    param_rel = d_rel.strftime("%d%m%y%H%M%S")
    usuario = session_user.login
    arq_rel = n_rel << param_rel << session_user.login

    rel = Document.new(:paper => :A4, :landscape => false, :row_per_pages => 60, :margin_top => 3.5)

    rel.before_page_create do
    set Eps.new("#{RAILS_ROOT}/public/images/siga.eps")
    text_in :x=> 8, :y=> 26.5, :text => "RELATÓRIO DE USUÁRIOS", :tag => :h1
    text_in :x=> 18.5, :y=> 27.5, :text =>  "Página:  %current_page%"
    text_in :x=> 5, :y=> 1.2, :text => "Emitido por SIG@ - Sistema de Gestão @dministrativa em " <<  d_rel.strftime("%d/%m/%Y - %H:%M:%S") << ' - ' << usuario
  end

  rel.rails_grid :style => :border_lines, :align => :center, :width => 17 do |grid|
      grid.column :id, :title => "CÓD", :align => :center, :width => 1
      grid.column :login, :title => "LOGIN", :align => :center, :width => 2
      grid.column :nome, :title => "NOME", :align => :left, :width => 6, :title_align => :center
      grid.column 'sector.setor', :title => "SETOR", :align => :left, :width => 7, :title_align => :center
      grid.column :adm, :title => "ADM", :align => :center, :width => 1
      grid.column :ger, :title => "GER", :align => :center, :width => 1
      grid.column :opr, :title => "OPR", :align => :center, :width => 1
      grid.data User.find(:all, :include => :sector, :limit => 1000)
    end

    rel.render :pdf, :filename => "#{RAILS_ROOT}/public/Relatorios/#{arq_rel}.pdf"
    conn = ActiveRecord::Base.connection
    conn.execute "INSERT INTO reports (relatorio, caminho, created_at, usuario) VALUES ('Usuários', '#{Local_rel}#{n_rel}.pdf', '#{d_rel}', '#{session_user.login}')"
    redirect_to :controller => 'reports', :action => 'index'
  end

end
