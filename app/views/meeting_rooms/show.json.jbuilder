json.extract! @meeting_room, :id, :title, :description,:max_number

json.partial! "meeting_rooms/meeting_room", meeting_room: @meeting_room