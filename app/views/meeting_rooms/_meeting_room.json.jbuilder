json.extract! meeting_room, :id, :title, :description,:max_number,:photo
json.meeting_room_orders meeting_room.orders.meeting_room_range_orders do |group|
  json.partial! "meeting_room_orders/meeting_room_order", meeting_room_order: group
end

