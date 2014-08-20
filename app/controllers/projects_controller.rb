class ProjectsController < ApplicationController
	def home
    @projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		redirect_to root_path
	end

	private

	def project_params
		params.require(:project).permit(:name)
	end
end
