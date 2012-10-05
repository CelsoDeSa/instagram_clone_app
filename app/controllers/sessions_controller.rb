class SessionsController < ApplicationController
  def create
  	user = User.from_omniauth(env["omniauth.auth"])
  	session[:user_id] = user.id
  	
	  	respond_to do |format|
	      format.html { render root_url }
	      format.json { render root_url }
	    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to('/')
  end
end
