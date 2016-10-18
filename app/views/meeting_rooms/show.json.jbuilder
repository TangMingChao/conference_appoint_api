json.extract! @meeting_room, :id, :title, :description,:max_number,:created_at, :updated_at

json.partial! "meeting_rooms/meeting_room", meeting_room: @meeting_room