class AccessControlController < ApplicationController
  def sign_in
    valid_user = User.where(name: params[:user][:name])
    if valid_user.empty?
      redirect_to users_path
    else
      session[:username] = params[:user][:name]
      session[:email] = params[:user][:email]
      session[:user_id] = valid_user[0].id

      redirect_to events_path
    end
  end

  def log_out
    session.destroy
    redirect_to users_path
  end

  def attend
    attend = Attendance.new
    attend.user_id = session[:user_id]
    attend.event_id = params[:id]
    attend.save
    redirect_to events_path
  end
end
