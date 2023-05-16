class RoomsController < ApplicationController
  def index
    @rooms = policy_scope(Room)
  end

  def show
    @room = Room.find(params[:id])
    authorize @room
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
