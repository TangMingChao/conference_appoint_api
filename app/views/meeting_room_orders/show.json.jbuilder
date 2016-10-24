
json.extract! @meeting_room_order,:id,:appoint_at,:meeting_room_id,:session, :state, :appoint_name, :appoint_phone, :created_at, :updated_at

json.partial! "meeting_room_orders/meeting_room_order", meeting_room_order: @meeting_room_order