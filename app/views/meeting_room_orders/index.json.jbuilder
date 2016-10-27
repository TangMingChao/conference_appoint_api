json.query_at @query_at
json.room_count @meeting_rooms.count
json.meeting_rooms @meeting_rooms do |room|
  json.id room.id
  json.title room.title
  json.max_number room.max_number

  json.time_range @time_range do |day|
    morning_key = "#{room.id}_#{day}_morning"
    afternoon_key = "#{room.id}_#{day}_afternoon"
    json.day day
    json.morning_state @order_hash[morning_key].try(:state) || "unused"
    json.afternoon_state @order_hash[afternoon_key].try(:state) || "unused"
  end
end
