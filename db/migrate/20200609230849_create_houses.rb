class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :size
      t.integer :user_id

      t.timestamps
    end
  end
end
