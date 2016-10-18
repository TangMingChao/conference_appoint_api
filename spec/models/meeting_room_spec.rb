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

require 'rails_helper'

RSpec.describe MeetingRoom, type: :model do
  it { should have_many(:orders) } 
end
