class UsersClearenceTable < ActiveRecord::Migration
  def change
	create_table :userClearence, :id => false do |t|
		t.integer :userid
		t.string :userClearence
	end
  end
end