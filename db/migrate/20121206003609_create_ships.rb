class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :crew
      t.boolean :has_astromech
      t.integer :speed
      t.string :armament

      t.timestamps
    end
  end
end
