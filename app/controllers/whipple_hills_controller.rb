class WhippleHillsController < ApplicationController
	def create
		WhippleHill.delete_all
		WhippleHill.import(params[:whipple_hill][:file])
		redirect_to whipple_hills_path
	end

	def index
		@import_present = WhippleHill.first
	end
end
