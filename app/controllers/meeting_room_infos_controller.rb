class MeetingRoomInfosController < ApplicationController
  before_action :set_meeting_room, only: [:show]

  respond_to :json

  def index
    @meeting_room_infos = Order.where(appoint_at: (Time.now.midnight - 2.day)..(Time.now.midnight + 5.day))
    #where(appoint_at: (query_at.midnight - 2.day) .. (query_at.midnight + 5.day))
    # @meeting_room_infos.each do |order|
    #   appoint_at = order.appoint_at
    #   room_title = order.meeting_room.title
    #   room_max_number = order.meeting_room.max_number
    #   room_photo = order.meeting_room.photo
    #   session = order.session 
    #   state = order.state
    #   appoint_name = order.appoint_name
    #   appoint_phone = order.appoint_phone
    # end
    respond_with(@meeting_room_infos)
  end

  def show
    respond_with(@meeting_room_info)
  end
  private
    def set_meeting_room
      @meeting_room_info = Order.find(params[:id])
    end
end
