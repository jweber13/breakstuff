class RoomsController < ApplicationController
  def index
    @rooms = policy_scope(Room)
    @owned_rooms = @rooms.where(user: current_user)
    @not_owned_rooms = @rooms.where.not(user: current_user)
    # if params[:query].present?
    #   sql_subquery = <<~SQL
    #     rooms.name ILIKE :query
    #     OR rooms.description ILIKE :query
    #     OR rooms.story ILIKE :query
    #     OR users.username ILIKE :query
    #   SQL
    #   @not_owned_rooms = @not_owned_rooms.joins(:user).where(sql_subquery, query: "%#{params[:query]}%")
    # end
    if params[:query].present?
      @not_owned_rooms = Room.search_by_attributes(params[:query]).where.not(user: current_user)
    end
  end

  # def index
  #   @movies = Movie.all
  #   if params[:query].present?
  #     @movies = @movies.where(title: params[:query])
  #   end
  # end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    authorize @room
    # authorize @booking
  end

  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    authorize(@room)

    if @room.save
      redirect_to room_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # strong params -> white listing the info coming from the form
  def room_params
    params.require(:room).permit(:name, :address, :capacity, :description, :story, :price, :photo)
  end
end
