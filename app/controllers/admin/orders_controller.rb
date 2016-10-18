class Admin::OrdersController < ApplicationController
  include ActionView::Layouts
  include ActionController::MimeResponds

  acts_as_token_authentication_handler_for Administrator
  before_action :set_admin_order, only: [:show,:accept,:refuse]

  respond_to :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @admin_orders = Order.paginate(page: page, per_page: per_page)
  #  respond_with @admin_orders,template: "admin_orders/show", status: 200
    respond_with (@admin_orders)
  end

  def show
    respond_with @admin_order,template: "admin_orders/show", status: 200
  end

  def accept
    @admin_order.update_state_order_accept#(update_check_params[:state])
    respond_with @admin_order,template: "admin_orders/show", status: 200
  end


  def refuse
    @admin_order.update_state_order_refuse#(update_check_params[:state])
    respond_with @admin_order,template: "admin_orders/show", status: 200
  end
  private
    def set_admin_order
      @admin_order = Order.find(params[:id])
    end
    # def update_check_params
    #   params.require(:order).permit(
    #     :state
    #     )
    # end
   
end
