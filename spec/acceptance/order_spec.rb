require 'acceptance_helper'

resource "预约电子会议室的订单" do
  header "Accept", "application/json"

  post "/orders" do
    
    # user_attrs = FactoryGirl.attributes_for(:user)
    order_attrs = FactoryGirl.attributes_for(:order)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Email", user_attrs[:email]

    # before do
    #   @user = create(:user)
    # end
      
      ########################## ssss
      parameter :appoint_name, "预约人姓名", require: true, scope: :order
    	parameter :appoint_phone, "预约人联系电话", require: true, scope: :order
    	parameter :join_number, "参加会议的人数", require: true, scope: :order
    	parameter :appoint_at, "预约会议日期", require: true, scope: :order
    	parameter :session, "会议室开放时间", require: true, scope: :order
    	parameter :state, "预约订单的状态", require: true, scope: :order
      parameter :room_layout, "预约会议室的布局", require: true, scope: :order
   	 	parameter :is_projector, "预约是否需要投影仪", require: true, scope: :order
    	parameter :is_meeting_phone, "预约是否需要会议电话", require: true, scope: :order
    	parameter :meeting_room_id, "预约的会议室", require: true, scope: :order
      parameter :sign, "预约的会议室", require: true, scope: :order
    					#########

   	 	let(:appoint_name) {order_attrs[:appoint_name]}
    	let(:appoint_phone) {order_attrs[:appoint_phone]}
    	let(:join_number) {order_attrs[:join_number]}
    	let(:appoint_at) {order_attrs[:appoint_at]}
    	let(:session) {order_attrs[:session]}
    	let(:state) {order_attrs[:state]}
    	let(:room_layout) {order_attrs[:room_layout]}
    	let(:is_projector) {order_attrs[:is_projector]}
    	let(:is_meeting_phone) {order_attrs[:is_meeting_phone]}
    	let(:meeting_room_id) {order_attrs[:meeting_room_id]}
      let(:sign) {order_attrs[:sign]}


    ################################# 
 
  	example "用户创建新的预约订单成功" do
  		do_request
  		puts response_body
      expect(status).to eq(201)
  	end
  	
  end

  get "/orders" do

  	# user_attrs = FactoryGirl.attributes_for(:user)

   #  header "X-User-Token", user_attrs[:authentication_token]
   #  header "X-User-Email", user_attrs[:email]

     before do
     # @user = create(:user)
     @orders = create_list(:order, 5, join_number: 3)
     end

    parameter :page, "当前页", require: false
    parameter :per_page, "每页的数量", require: false

    let(:page) {1}
    let(:per_page) {4}

  	example "用户获取预约订单列表成功" do
  		do_request
  		puts response_body
      expect(status).to eq(200)
  	end	
  end
  

  get "/orders/:id" do

  	# user_attrs = FactoryGirl.attributes_for(:user)

   #  header "X-User-Token", user_attrs[:authentication_token]
   #  header "X-User-Email", user_attrs[:email]

    before do
      # @user = create(:user)
      @orders = create_list(:order,5 , join_number: 3)
    end

  	let(:id) { @orders.first.id }

  	example "用户获取指定的预约订单详情成功" do
  		do_request

  		puts response_body
        expect(status).to eq(200)
  	end
  end
end