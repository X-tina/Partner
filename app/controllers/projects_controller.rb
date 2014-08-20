class ProjectsController < ApplicationController

  def home
    @projects = Project.all
  end

  def new
    @project = Project.new
    render :show_form
  end

  def create
    @project = Project.create(project_params)
    @projects = Project.all
  end

  def edit
  	@project = Project.find(params[:id])
  	render :show_form
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    @projects = Project.all
    render :hide_form
  end

  def destroy
    @project = Project.find(params[:id]).destroy
    @projects = Project.all
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
