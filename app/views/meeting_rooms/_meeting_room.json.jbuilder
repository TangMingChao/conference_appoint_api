json.extract! meeting_room, :id, :title, :description,:max_number

json.meeting_room_orders meeting_room.orders do |order|
  json.partial! "meeting_room_orders/meeting_room_order", meeting_room_order: order
end