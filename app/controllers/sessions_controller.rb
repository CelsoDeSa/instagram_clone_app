class SessionsController < ApplicationController
  def create
  	user = User.from_omniauth(env["omniauth.auth"])
  	session[:user_id] = user.id
  	redirect_to ('/pictures/1')
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to('/')
  end
end
