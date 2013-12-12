class CreateFileImports < ActiveRecord::Migration
  def change
    create_table :file_imports do |t|
      t.string :name
      t.string :fields

      t.timestamps
    end
  end
end
