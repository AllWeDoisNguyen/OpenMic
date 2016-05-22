class ComediansController < ApplicationController
  before_action :set_comedian, only: [:show, :edit, :update, :destroy]

  # Get a comedian's shows
  # Show.find(Comedian.last.bookings.last.show_id)

  # GET /comedians
  # GET /comedians.json
  def index
    @comedians = Comedian.all
    @bookings = Booking.all
    @shows = Show.all
  end

  # GET /comedians/1
  # GET /comedians/1.json
  def show
    if @comedian.reviews.blank?
      @average_review = 0
    else
      @average_review = @comedian.reviews.average(:rating).round(2)
    end
  end

  # GET /comedians/new
  def new
    @comedian = Comedian.new
  end

  # GET /comedians/1/edit
  def edit
  end

  def testing_view
    @comedians = Comedian.all
  end

  # POST /comedians
  # POST /comedians.json
  def create
    @comedian = Comedian.new(comedian_params)
    respond_to do |format|
      if @comedian.save
        format.html { redirect_to @comedian, notice: 'Comedian account was successfully created.' }
        format.json { render :show, status: :created, location: @comedian }
        session[:comedian_id] = @comedian.id
      else
        format.html { render :new }
        format.json { render json: @comedian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comedians/1
  # PATCH/PUT /comedians/1.json
  def update
    respond_to do |format|
      if @comedian.update(comedian_params)
        format.html { redirect_to @comedian, notice: 'Comedian was successfully updated.' }
        format.json { render :show, status: :ok, location: @comedian }
      else
        format.html { render :edit }
        format.json { render json: @comedian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comedians/1
  # DELETE /comedians/1.json
  def destroy
    @comedian.destroy
    respond_to do |format|
      format.html { redirect_to comedians_url, notice: 'Comedian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comedian
      @comedian = Comedian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comedian_params
      params.require(:comedian).permit(:avatar, :name, :username, :password,
                                       :password_confirmation, :bookings, :bio, :city, :twitter_handle, :facebook, :youtube)
    end
end
