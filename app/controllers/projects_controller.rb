class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def home
    @projects = Project.all
  end

  def new
    @project = Project.new
    render :show_form
  end

  def create
    @project = Project.new(project_params)
    
    save_project
  end

  def edit
  	@project = project_find
  	render :show_form
  end

  def update
    @project = project_find
    @project.assign_attributes(project_params)

    save_project    
  end

  def destroy
    @project = project_find.destroy
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def project_find
  	Project.find(params[:id])
  end

  def save_project
  	if @project.save
  		@projects = Project.all
      render :hide_form
  	else
      render :show_form
  	end
  end
end
