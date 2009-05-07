class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create] #Потом надо удалить!!!!
  before_filter :require_user, :only => [:edit, :update]

  def index
    @users = User.all
  end

  # GET /users/1
   def show
     @user = User.find_by_id(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    #if (@current_user.is_admin)
    #  @user = User.find_by_id(params[:id])
    #else
    #  @user = @current_user
    #end
    
    @user = @current_user
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    if @user.save
       flash[:notice] = 'User was successfully created.'
       redirect_back_or_default account_url
    else
      render :action => :new
    end
  end

  # PUT /users/1
  def update
    #to add administrative logic!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
    #@user = User.find(params[:id])
    #@user = @current_user
    
    @user = @current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Account successfully updated.'
      redirect_to account_url(:id=>@user.id)
    else
      render :action => :edit
    end
  end

  # DELETE /users/1
 # def destroy
 #   @user = User.find(params[:id])
 #   @user.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(users_url) }
#      format.xml  { head :ok }
#    end
#  end*/
end
