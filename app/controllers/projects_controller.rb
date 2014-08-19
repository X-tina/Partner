class ProjectsController < ApplicationController
	def home
    @projects = Project.all
	end
end
