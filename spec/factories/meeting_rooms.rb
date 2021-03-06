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

FactoryGirl.define do
  factory :meeting_room do
    title "meetingroom title"
    description "meetingroom description"
    max_number 160
  end
end
