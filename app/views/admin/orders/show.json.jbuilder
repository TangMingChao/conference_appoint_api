json.extract! admin_order, :id, :appoint_name, :appoint_phone, :join_number, :appoint_at,
                     :layout, :meeting_room_id,:is_projector,
                     :is_meeting_phone,:created_at, :updated_at
json.partial! "admin_orders/admin_order", admin_order: @admin_order


