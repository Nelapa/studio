class ProjectsController < ApplicationController
  
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Array.new;
    4.times do |i|
      @projects[i] = Project.find(:all, :conditions => 'section_id = '+(i+1).to_s, :order => 'position ASC')
    end
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
    
    @projects = Project.find(:all, :conditions=> "section_id = " + @project.section_id.to_s, :order => "position ASC")
    
  if @projects.length >0
      @project.position = @projects.last.position+1
  else
    @project.position = 1
  end
    
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
      photos = AttachedPhoto.find(:all, :conditions => "project_id = " + @project.id.to_s)
      if (photos.length >0)
        photos.each do |photo|
          photo.destroy
        end
      end
      @project.destroy
      redirect_to(projects_url)
    end 
  end 

  def move
    if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method]) and params[:id] =~ /^\d+$/
      Project.find(params[:id]).send(params[:method])
    end
    redirect_to edit_project_path(:id => params[:id])
  end 
end
