
json.extract! @meeting_room_info, :id,:appoint_at,:meeting_room_id,:session, :state, :appoint_name, :appoint_phone, :created_at, :updated_at
json.partial! "meeting_room_infos/meeting_room_info", meeting_room_info: @meeting_room_info