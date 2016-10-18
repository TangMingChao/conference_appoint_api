json.extract! order, :id, :appoint_name, :appoint_phone, :join_number, :appoint_at,
                     :session, :state,:layout, :meeting_room_id,:is_projector,
                     :is_meeting_phone,:created_at, :updated_at
json.url order_url(order, format: :json)