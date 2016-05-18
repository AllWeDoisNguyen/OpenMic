class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @comedians = Comedian.all
    @comedian = Comedian.new
    @shows = Show.all
    @bookings = Booking.all
    @booking = Booking.new
    @user = User.new
    @users = User.all
  end

  # GET /shows/new
  def new
    @show = Show.new
    @booking = Booking.new
    @comedian = Comedian.new
    @comedians = Comedian.all
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)
    @show.save
    @comedians_to_book = bookings_params
    @comedians_to_book.each do |c|
      @booking = @show.bookings.new(comedian_id: c)
      @booking.save
    end
    @comedians = Comedian.all

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:venue, :venue_website, :date, :time)
    end

    def bookings_params
      @bookings_params = params[:show][:bookings_attributes]
      @booking_values = @bookings_params.values
      @booking_values.map! do |x|
        x["comedian_id"].to_i
      end
      @booking_values
    end
end
