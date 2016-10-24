# == Schema Information
#
# Table name: meeting_rooms
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  max_number  :integer
#  photo       :string
#  state       :integer          default("unused")
#

class MeetingRoom < ApplicationRecord
  include AASM
  has_many :orders
  # has_many :groups, class_name: "Order", dependent: :destroy
	validates :title,:description,:max_number,presence: true
	# validates :title,uniqueness:true

 ###########################   update_state   ##################
 enum state:{

  unused: 0 ,
  checking: 1 ,
  used: 2
 }

  aasm :column => :state, :enum => true do
    state :unused, :initial => true
    state :checking
    state :used

    event :check do
      transitions :from => :unused , :to => :checking
    end

    event :use do
      transitions :from => :checking , :to => :used
    end

    event :unuse do
      transitions :from => [:checking,:used] , :to => :unused
    end
  end  
end
