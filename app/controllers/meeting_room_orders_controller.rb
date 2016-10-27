class MeetingRoomOrdersController < ApplicationController
  before_action :set_order, only: [:show]
  respond_to :json

  def index
    @query_at = params[:query_at].present? ? Time.zone.parse(params[:query_at]).to_date : Time.zone.today+2.days
    @time_range = ((@query_at - 2.day) .. (@query_at + 5.day))
    range_orders  = Order.orders_with_range(@time_range)
    @order_hash = {}

    @meeting_rooms = MeetingRoom.all
    range_orders.each do |order|
      key = "#{order.meeting_room_id}_#{order.appoint_at}_#{order.session}"
      @order_hash[key] = order
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
