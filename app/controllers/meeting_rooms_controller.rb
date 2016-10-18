class MeetingRoomsController < ApplicationController
  include ActionView::Layouts
  include ActionController::MimeResponds

  # acts_as_token_authentication_handler_for User#, except: [:check, :reset] 
  before_action :set_meeting_room, only: [:show]

  respond_to :json

  def index
    @meeting_rooms = MeetingRoom.all
    respond_with(@meeting_rooms)
  end

  def show
    respond_with(@meeting_room)
  end

  # def new
  #   @meeting_room = MeetingRoom.new
  #   respond_with(@meeting_room)
  # end

  # def edit
  # end

  def create
    @meeting_room = MeetingRoom.new(meeting_room_params)
    @meeting_room.save
    respond_with @meeting_room,template:"meeting_rooms/show",status: 201  ######
  end

  # def update
  #   @meeting_room.update(meeting_room_params)
  #   respond_with(@meeting_room)
  # end

  # def destroy
  #   @meeting_room.destroy
  #   respond_with(@meeting_room)
  # end

  private
    def set_meeting_room
      @meeting_room = MeetingRoom.find(params[:id])
    end

    def meeting_room_params
      params.require(:meeting_room).permit(:title, :description,:max_number)
    end
end
