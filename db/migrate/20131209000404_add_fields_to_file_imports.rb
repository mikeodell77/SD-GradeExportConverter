class AddFieldsToFileImports < ActiveRecord::Migration
  def change
    add_column :file_imports, :last_name, :string
    add_column :file_imports, :first_name, :string
    add_column :file_imports, :student_id, :string
    add_column :file_imports, :course_id, :string
    add_column :file_imports, :section_num, :integer
    add_column :file_imports, :grade, :string
    add_column :file_imports, :effort, :string
    add_column :file_imports, :conduct, :string
    add_column :file_imports, :comment, :string
  end
end
