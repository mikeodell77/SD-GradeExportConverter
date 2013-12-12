class UploadStepsController < ApplicationController
	include Wicked::Wizard
	steps :upload_students

	def show
		render_wizard
	end

end
