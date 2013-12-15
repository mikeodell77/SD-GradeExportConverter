class WhippleHill < ActiveRecord::Base
  attr_accessible :email, :whipple_hill_id

  def self.import(file)
  	spreadsheet = open_spreadsheet(file)
  	(2..spreadsheet.last_row).each do |i|
  	  row = spreadsheet.row(i)
  	  whipple = WhippleHill.new
  	  whipple.email = row[20]
  	  whipple.whipple_hill_id = row[18]
  	  whipple.save!
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
