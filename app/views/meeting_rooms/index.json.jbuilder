json.current_page @meeting_rooms.current_page
json.total_pages @meeting_rooms.total_pages
json.meeting_rooms @meeting_rooms, partial: 'meeting_rooms/meeting_room', as: :meeting_room