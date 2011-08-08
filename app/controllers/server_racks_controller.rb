
class ServerRacksController < ApplicationController

   before_filter :filter
   respond_to :html, :xml
   
     
  # GET /server_racks
  # GET /server_racks.xml
  def index    
    @server_racks = ServerRack.all

    respond_with @server_racks
  end

  # GET /server_racks/1
  # GET /server_racks/1.xml
  def show
    @server_rack = ServerRack.find(params[:id])

    respond_with @server_rack
  end

  # GET /server_racks/new
  # GET /server_racks/new.xml
  def new
    @server_rack = ServerRack.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @server_rack }
    end
  end

  # GET /server_racks/1/edit
  def edit
    @server_rack = ServerRack.find(params[:id])
  end

  # POST /server_racks
  # POST /server_racks.xml
  def create
    @server_rack = ServerRack.new(params[:server_rack])

    respond_to do |format|
      if @server_rack.save
        format.html { redirect_to(@server_rack, :notice => 'Server rack was successfully created.') }
        format.xml  { render :xml => @server_rack, :status => :created, :location => @server_rack }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @server_rack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /server_racks/1
  # PUT /server_racks/1.xml
  def update
    @server_rack = ServerRack.find(params[:id])

    respond_to do |format|
      if @server_rack.update_attributes(params[:server_rack])
        format.html { redirect_to(@server_rack, :notice => 'Server rack was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @server_rack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /server_racks/1
  # DELETE /server_racks/1.xml
  def destroy
    @server_rack = ServerRack.find(params[:id])
    @server_rack.destroy

    respond_to do |format|
      format.html { redirect_to(server_racks_url) }
      format.xml  { head :ok }
    end
  end
end
