class CreateSeniorSystems < ActiveRecord::Migration
  def change
    create_table :senior_systems do |t|
      t.string :senior_system_id
      t.string :email

      t.timestamps
    end
  end
end
