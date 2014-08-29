class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def home
    #@projects = current_user.projects
    @projects = Project.accessible_by(current_ability)
  end

  def new
    @project = Project.new
    render :show_form
    authorize! :new, @project
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.user = current_user
    authorize! :create, @project
    
    save_project
  end

  def edit
  	@project = project_find
    authorize! :edit, @project
  	render :show_form
  end

  def update
    @project = project_find
    @project.assign_attributes(project_params)
    authorize! :update, @project

    save_project    
  end

  def destroy
    @project = project_find.destroy
    @projects = Project.accessible_by(current_ability)
  end

  private

  def project_params
    parameters = [:name]
    parameters << :status if current_user.admin?
    params.require(:project).permit(parameters)
  end

  def project_find
  	Project.find(params[:id])
  end

  def save_project
  	if @project.save
  		@projects = Project.accessible_by(current_ability)
      render :hide_form
  	else
      render :show_form
  	end
  end
end
