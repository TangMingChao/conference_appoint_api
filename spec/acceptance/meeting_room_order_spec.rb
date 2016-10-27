require 'acceptance_helper'

resource "会议室的使用信息" do
  header "Accept", "application/json"

  get "/meeting_room_orders" do
    before do
      @meeting_rooms = create_list(:meeting_room, 6, max_number: 5)
      create(:order, meeting_room_id: @meeting_rooms.first.id, session: 0, appoint_at: Time.zone.today + 1.day)
      sucess_order = create(:order, meeting_room_id: @meeting_rooms.last.id, session: 1, state: 0, appoint_at: Time.zone.today + 2.day)
      sucess_order.accept!
      refuse_order = create(:order, meeting_room_id: @meeting_rooms.last.id, session: 0, state: 0, appoint_at: Time.zone.today + 2.day)
      refuse_order.refuse!
    end

    example "用户查询会议室一周的使用情况成功" do
      do_request
       puts response_body
       expect(status).to eq(200)
    end
    
  end
end