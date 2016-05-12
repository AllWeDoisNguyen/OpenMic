class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    @comedian = Comedian.find_by(username: params[:username]).try(:authenticate, params[:password])
    
    if @user
      create_user
    elsif @comedian
      create_comedian
    elsif
      render action: 'new'	
      flash[:notice_login] = "Incorrect password or username."
    end
  end

  def create_user
  	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

  	return render action: 'new' unless @user
    session[:comedian_id] = nil
  	session[:user_id] = @user.id

  	p "***************"
  	p "user:" + session[:user_id].to_s
    p "comedian:" + session[:comedian_id].to_s
  	p "***************"

  	redirect_to users_path
  end

  def create_comedian
  	@comedian = Comedian.find_by(username: params[:username]).try(:authenticate, params[:password])

  	return render action: 'new' unless @comedian
    session[:user_id] = nil
  	session[:comedian_id] = @comedian.id

  	p "***************"
    p "user:" + session[:user_id].to_s
  	p "comedian:" + session[:comedian_id].to_s
  	p "***************"
  	redirect_to comedians_path
  end

  def destroy
    session[:user_id] = nil
    session[:comedian_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
