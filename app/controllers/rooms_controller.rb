class RoomsController < ApplicationController
  def index
    @rooms = policy_scope(Room)
    @owned_rooms = @rooms.where(user: current_user)
    @not_owned_rooms = @rooms.where.not(user: current_user)
  end

  def show
    @room = Room.find(params[:id])
    @booking = Booking.new
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
