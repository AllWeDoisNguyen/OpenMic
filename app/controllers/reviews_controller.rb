class ReviewsController < ApplicationController
	before_action :find_comedian
  before_action :check_current_user, only: [:create, :edit, :destroy]
  before_action :find_review, only: [:show, :edit, :update, :destroy]

	def new
		@review = Review.new
	end

	def create
    @review = Review.new(review_params)
    if @comedian.nil?
      @review.show_id = @show.id
    elsif @show.nil?
      #associate book with current user
      @review.comedian_id = @comedian.id
    end
          
    @review.user_id = current_user.id

		if @review.save
      if @review.comedian_id
        @review_direction = "com"
			 redirect_to comedian_path(@comedian)
      elsif @review.show_id
        @review_direction = "show"
        redirect_to show_path(@show)
      end    
		else
			render 'new'
		end
	end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to comedian_path(@comedian)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to comedian_path
  end

	private

	def review_params
		params.require(:review).permit(:rating, :comment, :id)
	end

	def find_comedian
      if (params[:comedian_id]).nil?
        @show = Show.find(params[:show_id])
      elsif 
        @comedian = Comedian.find(params[:comedian_id])
      end
	end

  def check_current_user
    if current_user.nil?
      flash[:notice_signin] = "Please log in to contribute."
      return redirect_to comedian_path(@comedian)
    end
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
