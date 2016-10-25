class MeetingRoomOrdersController < ApplicationController
  before_action :set_order, only: [:show]
  respond_to :json

  def index
    query_at = params[:query_at] || Time.now.midnight + 2.day
    time_range = ((query_at - 2.day) .. (query_at + 5.day))
    @orders  = Order.orders_with_range(time_range)

    meeting_room_orders = Array.new
    @meeting_rooms = MeetingRoom.all
    i = 0
    @meeting_rooms.each do |room|
      id = room.id
      @room_orders = @orders.where(meeting_room_id:2)
      time = query_at - 2.day
      while time < (query_at + 5.day)
        hash1 = Hash.new 
        hash2 = Hash.new 
        p time
        p room_orders = @room_orders.orders_with_range(time)
        if room_orders.present? 
            morning_order = room_orders.session_morning
            afternoon_order = room_orders.session_afternoon
            if morning_order.present?
                  if room_order.state == 1
                    hash1 = {"room_id" => id, "time_at" => time, "session" => "mornning", 
                      "state" => "checking", "room_order" => morning_order}
                  else
                    hash1 = {"room_id" => id, "time_at" => time, "session" => "mornning",
                      "state" => "used", "room_order" => morning_order}
                  end
            elsif afternoon_order.present?
                  if room_order.state == 1
                    hash2 = {"room_id" => id, "time_at" => time , "session" => "afternoon",
                      "state" => "checking", "room_order" => afternoon_order}
                  else
                    hash2 = {"room_id" => id, "time_at" => time , "session" => "afternoon",
                      "state" => "used", "room_order" => afternoon_order}
                  end
            end
        else
            hash1 = {"room_id" => id,"time_at" => time ,"session" => "mornning",
                    "state" => "unused", "room_order" => ""}
            hash2 = {"room_id" => id,"time_at" => time ,"session" => "afternoon",
                    "state" => "unused", "room_order" => ""}
        end
        meeting_room_orders[i] = hash1.to_hash
        i += 1
        meeting_room_orders[i] = hash2.to_hash
        i += 1
        time = (time + 1.day)
      end 
    end
    # p meeting_room_orders
    @meeting_room_orders = meeting_room_orders
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
