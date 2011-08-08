require 'rubygems'

class ServersController < ApplicationController
  
  before_filter :filter
  respond_to :html, :xml, :js
    
   def search
     q = "%#{params[:search]}%"
     @servers = Server.where("servers.name LIKE ? or servers.ip LIKE ? or servers.desc LIKE ? ", q, q, q).order(:name)
     respond_with @servers     
   end
   
   def telnet     
     @server = Server.find(params[:id])
     @port = params[:p]
     @str_result = @server.telnet(@port)[1] # getting second parameter from result (!), the first one is a boolean
   end
   
   
  # GET /servers
  # GET /servers.xml
  def index
    @servers = Server.all

    respond_with @servers 
  end

  # GET /servers/1
  # GET /servers/1.xml
  def show
    @server = Server.find(params[:id])

    respond_with @server
  end

  # GET /servers/new
  # GET /servers/new.xml
  def new
    @server = Server.new

    respond_with @server
  end

  # GET /servers/1/edit
  def edit
    @server = Server.find(params[:id])
  end
  

  
  # GET /servers/1/ping
  def ping
  	@server = Server.find(params[:id])
    @str_result = @server.ping[1] # getting second parameter from result (!)   
  end
 
   # GET /servers/1/disks
  def disks
    
	@server = Server.find(params[:id])
	result  = @server.disks
	if result[0]
	  @str_result = result[1]
	  @file_systems = result[2]
	else
	  @str_result = result[1]
	end
	
  end
  
  
  
  
  
  # GET /servers/1/command
  def command
    
    valid_commands = Hash[
    	"top"      => "TERM=linux & top -b -n 1",
    	"freem"    => "free -m",
    	"who"      => "who",
    	"ifconfig" => "ifconfig",
    	"netstat"  => "netstat",
    	"cpuinfo"  => "cat /proc/cpuinfo",
    	"du"       => "du -h --max-depth=1 /",
    	"uptime"   => "uptime"
    ]
    
    cmd = valid_commands[params[:cmd]]
        
	@server = Server.find(params[:id])
	result = @server.ssh  cmd 
	@str_result = result[1]
	
  end
  
  
 
   
  

  # POST /servers
  # POST /servers.xml
  def create
    @server = Server.new(params[:server])

    respond_to do |format|
      if @server.save
        format.html { redirect_to(@server, :notice => 'Server was successfully created.') }
        format.xml  { render :xml => @server, :status => :created, :location => @server }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /servers/1
  # PUT /servers/1.xml
  def update
    @server = Server.find(params[:id])

    respond_to do |format|
      if @server.update_attributes(params[:server])
        format.html { redirect_to(@server, :notice => 'Server was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @server.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /servers/1
  # DELETE /servers/1.xml
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.xml  { head :ok }
    end
  end
end
