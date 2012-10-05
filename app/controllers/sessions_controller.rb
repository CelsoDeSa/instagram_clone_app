class SessionsController < ApplicationController
    after_create :redirect      
    
  
  def redirect
    redirect_to root_url
  end


  def create
  	user = User.from_omniauth(env["omniauth.auth"])
  	session[:user_id] = user.id
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to('/')
  end
end
