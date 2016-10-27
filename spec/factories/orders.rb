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

#

FactoryGirl.define do
  factory :order do
    appoint_name "appoint_name"
    appoint_phone "appoint_phone"
    join_number 50
    appoint_at "2016-10-30 00:00:00"
    meeting_room_id 2
    sign "sign"
    # session 0
    layout 0
    user_id 1
    is_projector true
    is_meeting_phone true
  end
end
