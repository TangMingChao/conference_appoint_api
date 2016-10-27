require 'acceptance_helper'

resource "会议室的使用信息" do
  header "Accept", "application/json"

  get "/meeting_room_orders" do
    before do
     @meeting_rooms = create_list(:meeting_room, 2, max_number: 1)
     create_list(:order, 5, join_number: 40)
    end
    # let(:meeting_room_id){ @meeting_room.id }

  	example "用户查询会议室一周的使用情况成功" do
  		do_request
       puts response_body
       expect(status).to eq(200)
  	end
  	
  end


  get "/meeting_room_orders/:id" do

    before do
      @orders = create_list(:order, 5, join_number: 40)
    end

  	let(:id) { @orders.first.id }

  	example "用户查询指定会议室的使用详情成功" do
  		do_request

  		puts response_body
      expect(status).to eq(200)
  	end
  end
end