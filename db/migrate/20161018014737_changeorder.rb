class Changeorder < ActiveRecord::Migration[5.0]
  def change
  	change_table :orders do |t|
  		t.remove :room_state
  	end

  end
end
