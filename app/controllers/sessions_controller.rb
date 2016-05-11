class SessionsController < ApplicationController
  def new
  end

  def create_user
  	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

  	return render action: 'new' unless @user

  	session[:user_id] = @user.id
  	redirect_to root_path
  end

  def create_comedian
  	@comedian = Comedian.find_by(username: params[:username]).try(:authenticate, params[:password])

  	return render action: 'new' unless @comedian

  	session[:comedian_id] = @comedian.id
  	redirect_to root_path

  end
end
