class SessionsController < ApplicationController
	before_action :authenticate_user, only: [:create, :create_user]
	before_action :authenticate_comedian, only: [:create, :create_comedian]

	#brings up the view to login as a user
  def new_user
  	render action: 'new_user'
  end
  #brings up the view to login as a comedian
  def new_comedian
  	render action: 'new_comedian'
  end

  #this logs in the user and starts the user session
  def create_user
  	unless @user
  		flash[:notice_login] = "Incorrect password or username."
  	  return render action: 'new_user'
  	end
  	session[:comedian_id] = nil
  	session[:user_id] = @user.id

  	p "***************"
  	p "user:" + session[:user_id].to_s
    p "comedian:" + session[:comedian_id].to_s
  	p "***************"
  	flash[:notice_login] = 'Signed in!'
  	redirect_to root_path
  end

  #this logs in the comedian and starts the comedian session
  def create_comedian
  	unless @comedian
  		flash[:notice_login] = "Incorrect password or username."
  	  return render action: 'new_comedian'
  	end
    session[:user_id] = nil
  	session[:comedian_id] = @comedian.id

  	p "***************"
    p "user:" + session[:user_id].to_s
  	p "comedian:" + session[:comedian_id].to_s
  	p "***************"
  	flash[:notice_login] = 'Signed in!'
  	redirect_to root_path
  end

  def destroy
  	@current_user = nil
    session[:user_id] = nil
    session[:comedian_id] = nil
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end

  private

  def authenticate_user
  	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  end

  def authenticate_comedian
  	@comedian = Comedian.find_by(username: params[:username]).try(:authenticate, params[:password])
  end

  def current_user_params
  	params.require(:user).permit(:name, :username, :bookings)
  end

  def current_comedian_params
  	params.require(:comedian).permit(:name, :username, :bookings)
  end

end
