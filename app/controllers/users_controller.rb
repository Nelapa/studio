class UsersController < ApplicationController
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def index
    @users = User.all
  end

  # GET /users/1
   def show
    @user = @current_user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
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
    @user = @current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Account successfully updated.'
      redirect_to account_url
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
