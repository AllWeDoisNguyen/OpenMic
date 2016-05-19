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

    if request.xhr?
    render '_index', layout: false, locals: { bookings: @bookings }
    end
    
    if params[:name]
      @find_comedian = Comedian.find_by(name: params[:name])
      @bookings = Booking.where(comedian_id: @find_comedian.id)
    end
    if params[:venue]
      @find_venue = Show.find_by(venue: params[:venue])
      @bookings = Booking.where(show_id: @find_venue.id)
    end
    if params[:show_name]
      @f_venue = Show.find_by(show_name: params[:show_name])
      @bookings = Booking.where(show_id: @f_venue.id)
    end
    if params[:date]
      @f_venue = Show.find_by(date: params[:date])
      @bookings = Booking.where(show_id: @f_venue.id)
    end
    if params[:time]
      @f_venue = Show.find_by(time: params[:time])
      @bookings = Booking.where(show_id: @f_venue.id)
    end
  end
end
