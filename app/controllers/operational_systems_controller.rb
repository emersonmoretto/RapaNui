class OperationalSystemsController < ApplicationController

  before_filter :filter

  # GET /operational_systems
  # GET /operational_systems.xml
  def index
    @operational_systems = OperationalSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operational_systems }
    end
  end

  # GET /operational_systems/1
  # GET /operational_systems/1.xml
  def show
    @operational_system = OperationalSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operational_system }
    end
  end

  # GET /operational_systems/new
  # GET /operational_systems/new.xml
  def new
    @operational_system = OperationalSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @operational_system }
    end
  end

  # GET /operational_systems/1/edit
  def edit
    @operational_system = OperationalSystem.find(params[:id])
  end

  # POST /operational_systems
  # POST /operational_systems.xml
  def create
    @operational_system = OperationalSystem.new(params[:operational_system])

    respond_to do |format|
      if @operational_system.save
        format.html { redirect_to(@operational_system, :notice => 'Operational system was successfully created.') }
        format.xml  { render :xml => @operational_system, :status => :created, :location => @operational_system }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @operational_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /operational_systems/1
  # PUT /operational_systems/1.xml
  def update
    @operational_system = OperationalSystem.find(params[:id])

    respond_to do |format|
      if @operational_system.update_attributes(params[:operational_system])
        format.html { redirect_to(@operational_system, :notice => 'Operational system was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @operational_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /operational_systems/1
  # DELETE /operational_systems/1.xml
  def destroy
    @operational_system = OperationalSystem.find(params[:id])
    @operational_system.destroy

    respond_to do |format|
      format.html { redirect_to(operational_systems_url) }
      format.xml  { head :ok }
    end
  end
end
