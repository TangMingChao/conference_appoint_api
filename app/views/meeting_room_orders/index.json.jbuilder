json.array!  @meeting_room_orders do |meeting_room_order|
             json.extract! meeting_room_order,:room_id,:time_at,:session,:state,:room_order;
             json.url meeting_room_order_url(meeting_room_order, format: :json)
end