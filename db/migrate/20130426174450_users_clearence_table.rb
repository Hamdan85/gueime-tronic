class UsersClearenceTable < ActiveRecord::Migration
  def change

	change_table :products do |t|
		t.integer :userid
		t.string :userClerence
	end
  end
end
