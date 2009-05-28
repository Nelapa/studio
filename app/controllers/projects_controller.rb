class ProjectsController < ApplicationController
  
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]
  
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
  def edit #+либо свой, либо админ
    @project = Project.find(params[:id])
    if (!current_user.is_admin && @project.author_id != @current_user.id)
    flash[:error] = "У Вас нет прав на данное действие!"
    redirect_back_or_default project_path(@project)
    end 
    #@attached_photo = AttachedPhoto.new
  end

  # POST /projects
  # POST /projects.xml
  def create #+либо админ, либо только свои
    @project = Project.new(params[:project])
    if (!current_user.is_admin)
     @project.author_id = @current_user.id   
    end
   
   if @project.save
        flash[:notice] = 'Проект успешно создан.'
         #redirect_to(@project) 
         redirect_to new_project_attached_photo_path(@project)
    else
        render :action => "new" 
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update #+либо свой, либо админ
    @project = Project.find(params[:id])
    
    if (!current_user.is_admin && @project.author_id != @current_user.id)
      flash[:error] = "У Вас нет прав на данное действие!"
      redirect_back_or_default project_path(@project)
    end 
  
    if @project.update_attributes(params[:project])
        flash[:notice] = 'Проект успешно обновлён.'
        redirect_to(@project)
    else
        render :action => "edit" 
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy #+либо свой, либо админ
    @project = Project.find(params[:id])
   
    if (!current_user.is_admin && @project.author_id != @current_user.id)
      flash[:error] = "У Вас нет прав на данное действие!"
      redirect_back_or_default project_path(@project)
    else
      @project.destroy
    redirect_to(projects_url)
    end 
  end
end
