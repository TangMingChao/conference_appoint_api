class MeetingRoomOrdersController < ApplicationController
  before_action :set_order, only: [:show]
  respond_to :json
  def index
    query_at = params[:query_at] || Time.now.midnight + 2.day
    time_range = ((query_at - 2.day) .. (query_at + 5.day))
    @range_orders  = Order.orders_with_range(time_range)

    order_hash = Hash.new
    @range_orders.each do |order|
      key = (order.meeting_room_id).to_s + "_" + (order.appoint_at).to_s + "_" + (order.session).to_s
      order_hash.store(key,order)
    end
    room_orders = Hash.new
    room_state = Array.new
    time = (query_at - 2.day)
    MeetingRoom.all.each do |room|
       id = room.id
       title = room.title
      while time < (query_at + 5.day)
        morning_key = id.to_s + "_" + time.to_s + "_" + "morning"
        afternoon_key = id.to_s + "_" + time.to_s + "_" + "afternoon"
        morning_state = order_hash["morning_key"]
        afternoon_state = order_hash["afternoon_key"] 
        num = 0
        room_state[num] = {"time_at":time,"morning_state":morning_state,"afternoon_state":afternoon_state}
        time = (time + 1.day)
        num += 1
      end
      title_id = title.to_s + "_" + id.to_s
      room_orders.store(title_id,room_state)
    end 
　    @meeting_room_orders = room_orders
    respond_with(@meeting_room_orders)　
  end
  

  def show
    respond_with(@meeting_room_order)
  end
  private
    def set_order
      @meeting_room_order = Order.find(params[:id])
    end
end
