class FileImportsController < ApplicationController
  # GET /file_imports
  # GET /file_imports.json
  def index
    @file_imports = FileImport.order(:course_id)
    @imported_files = CreateFile.all

    respond_to do |format|
	    format.html # index.html.erb
	    format.csv { send_data @file_imports.to_csv }
	    format.json { render json: @file_import }
    end
  end

  # GET /file_imports/1
  # GET /file_imports/1.json
  def show
    @file_import = FileImport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @file_import }
    end
  end

  # GET /file_imports/new
  # GET /file_imports/new.json
  def new
    @file_import = FileImport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file_import }
    end
  end

  # GET /file_imports/1/edit
  def edit
    @file_import = FileImport.find(params[:id])
  end

  # POST /file_imports
  # POST /file_imports.json
  def create
    # first delete all recorded uploaded files
    CreateFile.delete_all
    FileImport.delete_all

    files = params[:file_import][:file]
    files.each do |file|
      CreateFile.create(:file_name => file.original_filename)
      FileImport.import(file)
    end

    @file_imports = FileImport.order(:last_name)
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'File(s) imported successfully.' }
      format.json { render json: @file_import, status: :created, location: @file_import }
    end
  end

  # PUT /file_imports/1
  # PUT /file_imports/1.json
  def update
    @file_import = FileImport.find(params[:id])

    respond_to do |format|
      if @file_import.update_attributes(params[:file_import])
        format.html { redirect_to @file_import, notice: 'File import was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @file_import.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_imports/1
  # DELETE /file_imports/1.json
  def destroy
    @file_import = FileImport.find(params[:id])
    @file_import.destroy

    respond_to do |format|
      format.html { redirect_to file_imports_url }
      format.json { head :no_content }
    end
  end

  # IMPORT /import
	def import
		@file_import = FileImport.new
	end

  # PROCESS_IMPORT /upload
	def upload
		puts "We are processing the import! #{params[:file]}"
    unless params[:file].blank?
      params[:file].each do |file|
        FileImport.import(params[:file])
      end
    end 
		

		# now get them all
		@imports = FileImport.all

		redirect_to root_path
	end
end
