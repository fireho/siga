class PoisController < ApplicationController

  before_filter :load_map#, :except => []

  # GET /pois
  # GET /pois.xml
  def index
    @pois =  Poi.search(params[:search], params[:page])

    markerGroup = {}
    unless @pois.empty?
      @place_markers = []
      @multi_point = []
      @pois.each_with_index do |result,index|
        @map.icon_global_init(GIcon.new(
          :image => "/images/icons/map/#{result.kind}.png",
          :icon_anchor => GPoint.new(15,30),
          :info_window_anchor => GPoint.new(25,5)), "#{result.kind}_icon")
        marker = GMarker.new(GLatLng.new([result.geom.y, result.geom.x]),
          :title => result.name,
          :icon => "#{result.kind}_icon".to_sym)
        @multi_point << result.geom
        @place_markers << marker
      end
      envelope = MultiPoint.from_points(@multi_point).envelope
      @center = GLatLng.from_georuby(envelope.center)
      @zoom = @map.get_bounds_zoom_level(GLatLngBounds.from_georuby(envelope))
      @zoom.to_i
      @map.center_zoom_init(@center,@zoom)

      @place_markers.each_with_index { |marker,index|
        marker.on_click("myGroup.showMarker(#{index+1})")
        markerGroup.merge!({index+1 => marker})
      }
      @map.overlay_global_init(GMarkerGroup.new(true,markerGroup),"myGroup")

    #  flash.now[:notice] = "Listando #{@pois.size} pontos ..."
    else
      @map.center_zoom_init([-21,-46],6)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pois }
      format.json {
        render :text => {
          :centre    => @center ? [@center.lat, @center.lng] : [-21,-46],#envelope.center,
          :zoom      => 5, #TODO: @zoom.to_i,
          :resources => @pois.map { |r|
            { :name => r.name, :x => r.x, :y => r.y, :z => r.z, }}}.to_json}
    end
  end

  # GET /pois/1
  # GET /pois/1.xml
  def show
    @poi = Poi.find(params[:id])
    @map.center_zoom_init(GLatLng.from_georuby(@poi.geom), 10)
    marker = GMarker.new([@poi.y,@poi.x,@poi.z],
      :title => @poi.name,
      :info_window => "Group: #{@poi.group.name} <br> Criado em: #{@poi.created_at}")

    @map.overlay_init(marker)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poi }
    end
  end

  # GET /pois/new
  # GET /pois/new.xml
  def new
    @poi  = Poi.new
    @map.center_zoom_init([-21,-46], 6)
    @map.event_init(@map, 'click', 'setUnicPoint')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poi }
    end
  end

  # GET /pois/1/edit
  def edit
    @poi  = Poi.find(params[:id])
      @map.center_zoom_init(GLatLng.from_georuby(@poi.geom), 10)
      marker = GMarker.new([@poi.y,@poi.x, @poi.z], :title => @poi.name,
        :info_window => "Group: #{@poi.group.name} <br> Criado em: #{@poi.created_at}")
      @map.overlay_init(marker)
    @map.event_init(@map, 'click', 'setUnicPoint')
  end

  # POST /pois
  # POST /pois.xml
  def create
    @poi = Poi.new(params[:poi])

    respond_to do |format|
      if @poi.save
        flash[:notice] = 'Ponto criado!'
        format.html { redirect_to(@poi) }
        format.xml  { render :xml => @poi, :status => :created, :location => @poi }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pois/1
  # PUT /pois/1.xml
  def update
    @poi = Poi.find(params[:id])

    respond_to do |format|
      if @poi.update_attributes(params[:poi])
        flash[:notice] = 'Ponto atualizado!'
        format.html { redirect_to(@poi) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poi.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.xml
  def destroy
    @poi = Poi.find(params[:id])
    @poi.destroy

    respond_to do |format|
      format.html { redirect_to(pois_url) }
      format.xml  { head :ok }
    end
  end

  private


  def load_map
    # @map = GMap.new("map")
    @map = Mapstraction.new("map", :openlayers)
    @map.control_init(:large_map => true, :map_type => true, :scale =>true)
  end

end
