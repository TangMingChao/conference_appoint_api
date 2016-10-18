require 'acceptance_helper'

resource "用户查询会议室的使用信息" do
  header "Accept", "application/json"

  get "/meeting_room_infos" do
    before do
     @orders = create_list(:order, 3, join_number: 4)
    end
  	example "用户查询会议室的使用情况成功" do
  		do_request
       puts response_body
       expect(status).to eq(200)
  	end
  	
  end


  get "/meeting_room_infos/:id" do

    before do
      @orders = create_list(:order, 3, join_number: 4)
    end

  	let(:id) { @orders.first.id }

  	example "用户查询指定会议室的信息成功" do
  		do_request

  		puts response_body
      expect(status).to eq(200)
  	end
  end
end