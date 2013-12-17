class FileImport < ActiveRecord::Base
	require 'quote_unquote'

  attr_accessible :fields, :name, :last_name, :first_name,
                  :student_id, :course_id, :section_num, :grade,
                  :grade_2, :grade_3, :grade_4, :grade_5,
                  :effort, :conduct, :comment, :comment_2,
                  :comment_3, :comment_4, :comment_5, :comment_text

  def self.import(file)
	spreadsheet = open_spreadsheet(file)
	header = spreadsheet.row(2)
	(3..spreadsheet.last_row).each do |i|
		row = Hash[[header, spreadsheet.row(i)].transpose]
		new_file_import = FileImport.new

		new_file_import.last_name = "#{row['Student Last']}"
		new_file_import.first_name = "#{row['Student First']}"
		whipple_student_id = row['Student User Id']
		whipple = WhippleHill.find_by_whipple_hill_id(whipple_student_id)
		# whipple = WhippleHill.find_by_sql ["select email from whipple_hills where whipple_hill_id = ?", whipple_student_id]
		puts "What is whipple : #{whipple.inspect}"
		senior = SeniorSystem.find_by_email(whipple.email)
		puts ">>>>>>>>>>>> senior : #{senior.inspect}"
		new_file_import.student_id = senior.senior_system_id
		new_file_import.course_id = "#{row['Course Code']}"
		new_file_import.section_num = "#{row['Section Id']}"
		cululative_grade = row['Cumulative'].to_f
		new_file_import.grade = cululative_grade.round

		new_file_import.save!
	end
  end

  def self.to_csv
		CSV.generate(:force_quotes=>true) do |csv|
			# csv << [:first_name, :last_name, :student_id, :course_id, :section_num, :grade, :grade_2, :grade_3, :grade_4, :grade_5, :effort, :conduct, :comment, :comment_2, :comment_3, :comment_4, :comment_5, :comment_text]
			all.each do |import|
				csv << [ import.last_name, import.first_name, import.student_id, import.course_id, import.section_num, import.grade, import.grade_2, import.grade_3, import.grade_4, import.grade_5, import.effort, import.conduct, import.comment, import.comment_2, import.comment_3, import.comment_4, import.comment_5, import.comment_text]
			end
		end
  end

  def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
			when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
			when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
			when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
			else raise "Unknown file type #{file.original_filename}"
		end
  end
end
