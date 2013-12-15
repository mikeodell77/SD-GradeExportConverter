class CreateWhippleHills < ActiveRecord::Migration
  def change
    create_table :whipple_hills do |t|
      t.integer :whipple_hill_id
      t.string :email

      t.timestamps
    end
  end
end
