class ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Review)
  end

  def create
    @room = Room.find(params[:room_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.room = @room
    authorize(@review)
    if @review.save
      redirect_to rooms_path
    else
      render "rooms/show", status: :unprocessable_entity
    end
  end

  private

  # strong params -> white listing the info coming from the form
  def review_params
    params.require(:review).permit(:content)
  end
end
