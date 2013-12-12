class SeniorSystem < ActiveRecord::Base
  attr_accessible :email, :senior_system_id

  def self.import(file)
	spreadsheet = open_spreadsheet(file)
		# header = spreadsheet.row(2)
		(1..spreadsheet.last_row).each do |i|
			row = spreadsheet.row(i)
			# row = Hash[[header, spreadsheet.row(i)].transpose]
			senior_system = SeniorSystem.new
			puts "we found this : #{row[0]}"
			
			senior_system.senior_system_id = "#{row[0]}"
			senior_system.email = "#{row[1]}"
			senior_system.save!
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
