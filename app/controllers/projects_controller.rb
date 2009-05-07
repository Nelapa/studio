class ProjectsController < ApplicationController
  
  before_filter :require_user, :only => [:edit, :update, :destroy]
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])
 
    if @project.save
        flash[:notice] = 'Project was successfully created.'
         redirect_to(@project) 
    else
        render :action => "new" 
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        redirect_to(@project)
    else
        render :action => "edit" 
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to(projects_url)  
  end
end
