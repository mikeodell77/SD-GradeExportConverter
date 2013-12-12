class CreateCreateFiles < ActiveRecord::Migration
  def change
    create_table :create_files do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
