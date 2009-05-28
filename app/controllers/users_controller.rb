class UsersController < ApplicationController
  
  before_filter :require_user, :only => [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  # GET /users/1
   def show
     @user = User.find_by_id(params[:id])
  end

  # GET /users/new
  def new
    if (User.all.length==0 ||(current_user && @current_user.is_admin))
      @user = User.new
    else
      flash[:error] = "У вас нет прав на данное действие!"
      redirect_back_or_default users_path
    end 
  end

  # GET /users/1/edit
  def edit
    if (current_user && @current_user.is_admin)
      @user = User.find_by_id(params[:id])
    else if (current_user && @current_user.id==params[:id])
      @user = @current_user
    else
      flash[:error] = "У вас нет прав на данное действие!"
      redirect_back_or_default user_path(@user)
    end
    end
    
    #@user = @current_user
  end

  # POST /users
  def create
       
    @user = User.new(params[:user])
    
    if User.find(:all).length==0
      @user.is_admin = true
    else if (!current_user || !@current_user.is_admin)
      flash[:error] = "У Вас нет прав на данное действие!"
      redirect_back_or_default root_path
      end
    end

    if @user.save
       flash[:notice] = 'Архитектор был добавлен'
       redirect_back_or_default user_path(User.find(:first, :conditions => "login = '"+@user.login+"'"))
    else
      flash[:error] = "Возникли проблемы при добавлении нового архитектора!"
      render :action => :new
    end
  end

  # PUT /users/1
  def update
    @user = User.find_by_id(params[:id])
    
    if (@user.is_admin && User.find(:all, :conditions => "is_admin = true").length==1)
      params[:user][:is_admin]=true;
    end

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Данные обновлены'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Возникли проблемы при изменении данных!'
      render :action => :edit
    end
  end

  # DELETE /users/1
 def destroy
    @user = User.find(params[:id])
    
    if (!current_user || !@current_user.is_admin || @user.id == @current_user.id)
      flash[:error] = "У Вас нет прав на данное действие!"
      redirect_back_or_default user_path(@user)
    else
    if (@user.is_admin &&User.find(:all, :conditions => "is_admin = true").length==1) 
      flash[:error] = "Нельзя удалить единственного администратора!"
      redirect_back_or_default user_path(@user)
    else
      Project.find(:all, :conditions=>"author_id="+@user.id).each do |project|
        project.update_attribute(:author_id, -1)
      end
      @user.destroy
      redirect_to users_path
    end
   end
  end
end
