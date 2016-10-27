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
#

class MeetingRoom < ApplicationRecord
  include AASM
  has_many :orders
	validates :title,:description,:max_number,presence: true
	# validates :title,uniqueness:true
end
