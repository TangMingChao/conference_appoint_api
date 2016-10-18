require 'acceptance_helper'

resource "电子会议室的资料" do
  header "Accept", "application/json"

#  ####################用户查询会议室的列表####################
  get '/meeting_rooms' do
    before do
      create_list(:meeting_room, 5, max_number: 5)
    end

    example "查询会议室的列表成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end
  
#  ##################用户查指定会议室的详情#####################
  get 'meeting_rooms/:id' do

    before do
      @meeting_rooms = create_list(:meeting_room, 5, max_number: 1)
    end

    let(:id) {@meeting_rooms.first.id}

    example "查询指定会议室的详情成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end

end