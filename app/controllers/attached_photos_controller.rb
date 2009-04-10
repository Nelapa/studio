class AttachedPhotosController < ApplicationController
  # GET /attached_photos
  # GET /attached_photos.xml
  def index
    @attached_photos = AttachedPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attached_photos }
    end
  end

  # GET /attached_photos/1
  # GET /attached_photos/1.xml
  def show
    @attached_photo = AttachedPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attached_photo }
    end
  end

  # GET /attached_photos/new
  # GET /attached_photos/new.xml
  def new
    @attached_photo = AttachedPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attached_photo }
    end
  end

  # GET /attached_photos/1/edit
  def edit
    @attached_photo = AttachedPhoto.find(params[:id])
  end

  # POST /attached_photos
  # POST /attached_photos.xml
  def create
    @attached_photo = AttachedPhoto.new(params[:attached_photo])

    respond_to do |format|
      if @attached_photo.save
        flash[:notice] = 'AttachedPhoto was successfully created.'
        format.html { redirect_to(@attached_photo) }
        format.xml  { render :xml => @attached_photo, :status => :created, :location => @attached_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attached_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attached_photos/1
  # PUT /attached_photos/1.xml
  def update
    @attached_photo = AttachedPhoto.find(params[:id])

    respond_to do |format|
      if @attached_photo.update_attributes(params[:attached_photo])
        flash[:notice] = 'AttachedPhoto was successfully updated.'
        format.html { redirect_to(@attached_photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attached_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attached_photos/1
  # DELETE /attached_photos/1.xml
  def destroy
    @attached_photo = AttachedPhoto.find(params[:id])
    @attached_photo.destroy

    respond_to do |format|
      format.html { redirect_to(attached_photos_url) }
      format.xml  { head :ok }
    end
  end
end
