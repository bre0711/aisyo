class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :select_id,    null:false
      t.integer :vs_soldier_id,   null:false
      t.integer :vs_wizard_id,    null:false
      t.integer :vs_monk_id,      null:false
      t.integer :vs_fighter_id,   null:false
      t.integer :vs_gunner_id,    null:false

      t.timestamps
    end
  end
end
