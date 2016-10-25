require 'acceptance_helper'

resource "管理员对预约订单的审核" do
  header "Accept", "application/json"

  get "/admin/orders" do

  	administrator_attrs = FactoryGirl.attributes_for(:administrator)

    header "X-Administrator-Token", administrator_attrs[:authentication_token]
    header "X-Administrator-Phone", administrator_attrs[:phone]
    before do
     @administrator = create(:administrator)
     @orders = create_list(:order, 5, join_number: 50)
    end

    parameter :page, "当前页", require: false
    parameter :per_page, "每页的数量", require: false

    let(:page) {1}
    let(:per_page) {15}

  	example "管理员获取预约订单列表成功" do
  		do_request
       puts response_body
       expect(status).to eq(200)
  	end
  	
  end


  get "/admin/orders/:id" do

  	administrator_attrs = FactoryGirl.attributes_for(:administrator)

    header "X-Administrator-Token", administrator_attrs[:authentication_token]
    header "X-Administrator-Phone", administrator_attrs[:phone]

    before do
      @administrator = create(:administrator)
      @orders = create_list(:order, 5, join_number: 50)
    end

  	let(:id) { @orders.first.id }

  	example "管理员获取指定的预约订单详情成功" do
  		do_request

  		puts response_body
      expect(status).to eq(200)
  	end
  end
  
   post "/admin/orders/:id/accept" do
   
    administrator_attrs = FactoryGirl.attributes_for(:administrator)
    order_attrs = FactoryGirl.attributes_for(:order)

    header "X-Administrator-Token", administrator_attrs[:authentication_token]
    header "X-Administrator-Phone", administrator_attrs[:phone]
    parameter :state, "预约订单的状态", require: true, scope: :order
    before do
      @administrator = create(:administrator)
      @orders = create_list(:order, 5, join_number: 50)
    end

  	let(:id) { @orders.first.id } 
    	let(:state) {"2"}
 
  	example "管理员接受了预约订单" do
  		do_request
  		puts response_body
      expect(status).to eq(200)
      
  	end
  	
  end

   post "/admin/orders/:id/refuse" do
    # 
    administrator_attrs = FactoryGirl.attributes_for(:administrator)
    order_attrs = FactoryGirl.attributes_for(:order)

    header "X-Administrator-Token", administrator_attrs[:authentication_token]
    header "X-Administrator-Phone", administrator_attrs[:phone]
    parameter :state, "预约订单的状态", require: true, scope: :order
    before do
      @administrator = create(:administrator)
    @orders = create_list(:order, 5, join_number: 50)
    end

  	let(:id) { @orders.first.id }   
    	let(:state) {"0"}
 
  	example "管理员拒绝了预约订单成功" do
  		do_request
  		puts response_body
      expect(status).to eq(200)
  	end
  	
   end

end