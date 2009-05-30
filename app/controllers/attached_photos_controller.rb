class AttachedPhotosController < ApplicationController
  
  before_filter :require_user

  
  def new
    @attached_photo = AttachedPhoto.new
    @project = Project.find(params[:project_id])
  end
    
  def create
    @attached_photo = AttachedPhoto.new(params[:attached_photo])
    @attached_photo.project_id = params[:project_id];
    
    @photos = AttachedPhoto.find(:all, :conditions=> "project_id = " + @attached_photo.project_id.to_s, :order => "position ASC")
    
  if @photos.length >0
      @attached_photo.position = @photos.last.position+1
  else
    @attached_photo.position = 1
  end
    
    
      if @attached_photo.save
        flash[:notice] = 'Фотография добавлена'
      else
        flash[:error] = 'Ошибка при добавлении фотографии'
      end
      redirect_to project_path(Project.find(@attached_photo.project_id))
  end

  # DELETE /attached_photos/1
  # DELETE /attached_photos/1.xml
  def destroy
    @attached_photo = AttachedPhoto.find(params[:id])
    @attached_photo.destroy
    if @project=Project.find_by_id(@attached_photo.project_id)
      redirect_back_or_default edit_project_path(@project)
    end
  end

  def move
    if ["move_lower", "move_higher", "move_to_top", "move_to_bottom"].include?(params[:method]) and params[:id] =~ /^\d+$/
      AttachedPhoto.find(params[:id]).send(params[:method])
    end
    redirect_to edit_project_path(:id => params[:project_id])
  end 

end
