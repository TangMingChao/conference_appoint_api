class Changemeetingroom < ActiveRecord::Migration[5.0]
  def change
  	change_table :meeting_rooms do |t|
   		t.integer :state,default:0
  	end
  end
end
	