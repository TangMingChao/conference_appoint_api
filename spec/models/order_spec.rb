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

require 'rails_helper'

RSpec.describe Order, type: :model do
it { should belong_to(:meeting_room) } 
end
