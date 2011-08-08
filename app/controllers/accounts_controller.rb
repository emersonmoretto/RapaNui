class AccountsController < ApplicationController
  
  def login
    respond_to :html
  end
  
  def logout
    session[:user] = nil    
    redirect_to :controller=>"accounts", :action=>"login"
  end
  
  def doLogin
    login = params[:login]    
    passwd = params[:passwd]
    
    ## high secure auth
    if( login == "admin" && passwd == "passwd" )
      session[:user] = login
      redirect_to :controller=>"server_racks", :action=>"index"
    else
      flash[:notice] = "Try again, wrong password! Already try admin/passwd?"
      redirect_to :action=>"login", :notice => "Try again, wrong password! Already try admin/passwd?"     
    end
    
      
    ## Implement here your auth
    ## To log-in, you must to set session[:user] = login 
    
    
    ## Apache Basic auth - uncomment to use
    #url="http://intranet.saudedigital.org.br"
    #url=URI.parse(url)
    #http=Net::HTTP.new(url.host,url.port)
    #result_code = 0

    ##doing the request
    #Net::HTTP.start(url.host) do http
    #    req=Net::HTTP::Get.new(url)
    #    req.basic_auth login, passwd
    #    resp=http.request(req)
    #    result_code = resp.code
    # end       
    
    #checking result_code  
    #if result_code == '301'        
    #  session[:user] = login
    #  redirect_to :controller=>"server_racks", :action=>"index"
    #  return
    #else
    #  flash[:notice] = "Try again, wrong password!"
    #  redirect_to :action=>"login"
    #end    
    
  end
  
end