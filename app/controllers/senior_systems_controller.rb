class SeniorSystemsController < ApplicationController
	def create
		SeniorSystem.delete_all
      	SeniorSystem.import(params[:senior_system][:file])
      	redirect_to upload_steps_path
    end

    def import_senior_system
    	@import_present = SeniorSystem.first
    end
end
