class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def filter
      if session[:user].nil?
        redirect_to :controller=>"accounts", :action=>"login"
      return
    end
  end
  
end
