json.extract! meeting_room_order, :id,:appoint_at,:meeting_room_id,:session, :state, :appoint_name, 
							     :appoint_phone,  :created_at, :updated_at

json.url meeting_room_order_url(meeting_room_order, format: :json)