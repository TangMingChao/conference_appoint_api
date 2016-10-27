class OrdersController < ApplicationController
  include ActionView::Layouts
  include ActionController::MimeResponds

  # acts_as_token_authentication_handler_for User
  before_action :set_order, only: [:show]
  respond_to :json
 

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @orders = Order.all.paginate(page: page, per_page: per_page)
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  # def new
  #   @order = Order.new
  #   respond_with(@order)
  # end

  # def edit
  # end
  def create
    @order = Order.new(order_params)
    @order.save
    respond_with @order,template: "orders/show",status:201
  end

  # def update
  #   @order.update(order_params)
  #   respond_with(@order)
  # end

  # def destroy
  #   @order.destroy
  #   respond_with(@order)
  # end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:appoint_name, :appoint_phone, :join_number,:appoint_at,:session,
        :layout,:is_projector,:is_meeting_phone,:meeting_room_id,:sign)
    end
end
