class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.string :first_name
      t.string :last_name
      t.string :call_sign
      t.references :ship

      t.timestamps
    end
    add_index :pilots, :ship_id
  end
end
