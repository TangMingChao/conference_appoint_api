require 'acceptance_helper'

resource "电子会议室的信息" do
  header "Accept", "application/json"

#  ####################用户查询会议室的列表####################

  get '/meeting_rooms' do
    before do
      @meeting_rooms = create_list(:meeting_room, 6, max_number: 250)
      create_list(:order, 5, join_number: 50)
    end

    example "首页查询会议室的列表及使用情况成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end
  
#  ##################用户查指定会议室的详情#####################
  get 'meeting_rooms/:id' do

    before do
      @meeting_rooms = create_list(:meeting_room, 5, max_number: 250)
    end

    let(:id) {@meeting_rooms.first.id}

    example "首页查询指定会议室的详情成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end

end