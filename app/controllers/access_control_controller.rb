class AccessControlController < ApplicationController
  def sign_in
    if User.where(name: params[:user][:name]).empty?
      redirect_to users_path
    else
      session[:username] = params[:user][:name]
      session[:email] = params[:user][:email]
      redirect_to events_path
    end
  end

  def log_out
    session.destroy
    redirect_to users_path
  end
end
