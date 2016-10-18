class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :appoint_name
      t.string :appoint_phone
      t.string :sign

      t.integer :join_number
      t.integer :room_layout,default:0

      t.integer :session,default:0
      t.integer :state,default:0

      t.boolean :is_projector 
      t.boolean :is_meeting_phone 

      t.references :meeting_room, foreign_key: true
      t.references :user, foreign_key: true

      t.date :appoint_at
      t.date :query_at 

    

      t.timestamps
    end
  end
end
