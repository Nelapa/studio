class AttachedPhotosController < ApplicationController
  
  before_filter :require_user

  
  def new
    @attached_photo = AttachedPhoto.new
    @project = Project.find(params[:project_id])
  end
    
  def create
    @attached_photo = AttachedPhoto.new(params[:attached_photo])
    @attached_photo.project_id = params[:project_id];
    
      if @attached_photo.save
        flash[:notice] = 'Фотогрфия добавлена.'
      else
        flash[:error] = 'Ошибка при добавлении.'
      end
      redirect_to project_path(Project.find(@attached_photo.project_id))
  end

  # DELETE /attached_photos/1
  # DELETE /attached_photos/1.xml
  def destroy
    @attached_photo = AttachedPhoto.find(params[:id])
    @attached_photo.destroy
    @project = Project.find(params[:project_id])
    redirect_to edit_project_path(@project)
  end
  
end
