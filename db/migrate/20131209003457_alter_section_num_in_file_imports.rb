class AlterSectionNumInFileImports < ActiveRecord::Migration
  def up
		change_column :file_imports, :section_num, :string
  end

  def down
  end
end
