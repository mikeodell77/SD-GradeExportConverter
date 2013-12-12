class AddMissingFieldsToFileImport < ActiveRecord::Migration
  def change
	  add_column :file_imports, :grade_2, :string
		add_column :file_imports, :grade_3, :string
		add_column :file_imports, :grade_4, :string
		add_column :file_imports, :grade_5, :string
		add_column :file_imports, :comment_2, :string
		add_column :file_imports, :comment_3, :string
		add_column :file_imports, :comment_4, :string
		add_column :file_imports, :comment_5, :string
		add_column :file_imports, :comment_text, :text
  end
end
