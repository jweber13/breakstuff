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

    respond_to do |format|
      if @review.save
        format.html { redirect_to room_path(@room) }
        format.json do
          render json: {
            review_html: render_to_string(partial: "reviews/review", formats: :html, locals: { review: @review }),
            form_html: render_to_string(partial: "reviews/new", formats: :html, locals: { room: @review.room, review: Review.new }),
        }.to_json
      end
      else
        format.html { render "rooms/show", status: :unprocessable_entity }
        format.json do
          render json: {
            form_html: render_to_string(partial: "reviews/new", formats: :html, locals: { room: @review.room, review: @review }),
        }.to_json
        end
      end
    end
    # raise
    # if @review.save
    #   redirect_to room_path(@room)
    # else
    #   render "rooms/show", status: :unprocessable_entity
    # end
  end

  private

  # strong params -> white listing the info coming from the form
  def review_params
    params.require(:review).permit(:content)
  end
end
