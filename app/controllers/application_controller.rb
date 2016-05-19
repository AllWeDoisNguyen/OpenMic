class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_comedian

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def current_comedian
  	@current_comedian ||= Comedian.find_by(id: session[:comedian_id])
  end

  def require_logged_in
  	return true if current_user || current_comedian

  	return redirect_to root_path
  end

  def require_comedian_logged_in
  	return true if current_comedian

  	return redirect_to root_path
  end

  def testing_view
    @comedian = Comedian.first
  end

  def homepage
    @comedians = Comedian.all.sample(6)
    @comedian = Comedian.new
    @show = Show.new
    @shows = Show.all
    @bookings = Booking.all
    @booking = Booking.new
    @user = User.new
    @users = User.all
    @return_type = nil


    if params[:username]
      @comedians = Comedian.where(username: params[:username])
      @return_type = "com"
    end
    if params[:name]
      @comedians = Comedian.where(name: params[:name])
      @return_type = "com"
    end
    if params[:venue]
      @shows = Show.where(venue: params[:venue])
      @return_type = "show"
    end
    if params[:show_name]
      @shows = Show.where(show_name: params[:show_name])
      @return_type = "show"
    end
    if params[:date]
      @shows = Show.where(date: params[:date])
      @return_type = "show"
    end
    if params[:time]
      @shows = Show.where(time: params[:time])
      @return_type = "show"
    end

    p "*" * 50
    p @return_type
    p "*" * 50

  end
end
