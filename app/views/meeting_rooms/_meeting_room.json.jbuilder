json.extract! meeting_room, :id, :title, :description,:max_number,:created_at, :updated_at
json.url meeting_room_url(meeting_room, format: :json)