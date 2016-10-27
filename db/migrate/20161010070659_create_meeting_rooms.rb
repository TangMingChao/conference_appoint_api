class CreateMeetingRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :meeting_rooms do |t|
      t.string :title
      t.text :description
      t.integer :max_number
      t.string :photo
      
      t.timestamps
    end
  end
end
