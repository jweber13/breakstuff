class Owner::BookingsController < ApplicationController
  def index
    @rooms = Room.where(user: current_user)
  end
end
