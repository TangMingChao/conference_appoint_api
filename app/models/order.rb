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
#  query_at         :date
#

 # meeting_room.state:{
 #  unused: 0 ,
 #  checking: 1 ,
 #  used: 2
 # }

class Order < ApplicationRecord
  include AASM
  belongs_to :meeting_room ,foreign_key:"meeting_room_id"
  
  # belongs_to :user, foreign_key: :user_id
  # belongs_to :admin, class_name: "User", foreign_key: :user_id

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

 #  ############### update_state_order ############
  # after_create :update_state_order_check

  def update_state_order_check 
      self.check
      # self.meeting_room.check
  end

  def update_state_order_accept 
      self.accept
      # self.meeting_room.use
  end
  def update_state_order_refuse 
      self.refuse
      # self.meeting_room.unuse
  end 
 
  def room_state_alias
    I18n.t :"meeting_room_state.#{self.meeting_room.state}"
  end

  # def times
  #   between_times(query_at - 2.day, query_at + 5.day)
  # end

  # def week_order
  #    self.where(appoint_at: (query_at - 2.day) .. (query_at + 5.day))
  # end




  
















end



