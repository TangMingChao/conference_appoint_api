class MeetingRoomOrdersController < ApplicationController
  before_action :set_order, only: [:show]
  respond_to :json

  def index
    time_range = ((Time.now.midnight) .. (Time.now.midnight + 6.day))
    @meeting_room = MeetingRoom.find_by_id(params[:meeting_room_id])
    if @meeting_room
         @orders = @meeting_room.orders 
         @orders = @orders.where(appoint_at:time_range)
         @meeting_room_orders = @orders
         respond_with(@meeting_room_orders)
    end
  end

  def show
    respond_with(@meeting_room_order)
  end
  private
    def set_order
      @meeting_room_order = Order.find(params[:id])
    end
end
