# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  appoint_name     :string
#  appoint_phone    :string
#  join_number      :integer
#  session          :integer          default("morning")
#  state            :integer          default("unused")
#  meeting_room_id  :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  layout           :integer          default("rectangle")
#  user_id          :integer
#  is_projector     :boolean          default(TRUE)
#  is_meeting_phone :boolean          default(TRUE)
#  sign             :text
#  appoint_at       :date
#

class Order < ApplicationRecord
  include AASM
  belongs_to :meeting_room ,foreign_key:"meeting_room_id"
  ################validates#####################
  validates_presence_of :appoint_name, on: :create, message: " appoint_name不能为空"
  validates_presence_of :appoint_phone, on: :create, message: "appoint_phone不能为空"
  validates_presence_of :join_number, on: :create, message: "join_number不能为空"
  validates_presence_of :appoint_at, on: :create, message: "appoint_at不能为空"

  ####################### validate_time ################
  
  # before_save :appoint_at_time_validate
  before_create :update_state_order_check

  def appoint_at_time_validate     
    if appoint_at.present? && (appoint_at - 2.day) > Time.zone.now
      errors.add(:appoint_at, "Electronic meeting rooms must be appointed of before three days ！")
    end
  end
  ######################  meeting_room.uniqueness #############################
  # validates_uniqueness_of :meeting_room_id,scope: [:appoint_at,:session]

  ###################  Enum  ########################
  enum layout: {

        rectangle: 0,
        roundness: 1 
  }
  enum session: {

        morning: 0,
        afternoon: 1 

  } 
   ################ order_state ###############
  enum state: {

        unused: 0 ,
        checking: 1 ,
        success: 2 ,
        failure: 3
  }
  aasm  :column => :state, :enum => true do
    state :unused, :initial => true
    state :checking
    state :success
    state :failure

    event :check do
      transitions :from => :unused, :to => :checking
    end

    event :accept do
      transitions :from => :checking, :to => :success
    end

    event :refuse do
      transitions :from => [:checking], :to => :unused
    end
  end
   ############### update_state_order ############
  def update_state_order_check 
      self.check
  end

  def update_state_order_accept 
      self.accept
  end
  def update_state_order_refuse 
      self.refuse
  end 
   ############### where_order ##############
  scope :orders_with_range, ->(range) { where(appoint_at:range) }
  scope :meeting_room_orders, ->(id) {where(meeting_room_id:id)}
   #################### where_range_orders_in_meeting_room_jbuilder ##################
  def self.meeting_room_range_orders
    query_at = query_at || Time.now.midnight + 2.day
    time_range = ((query_at - 2.day) .. (query_at + 5.day))
    self.orders_with_range(time_range)
  end
end



