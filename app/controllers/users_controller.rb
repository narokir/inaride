class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update, :show]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: [:destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page],limit: 10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @rides = @user.rides.paginate(page: params[:page])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      respond_to do |format|
      #UserMailer.registration_email(@user).deliver
        format.html { redirect_back_or @user }
        format.js  
      end
      flash[:success] = "Hey #{current_user.first_name}, welcome to inaride"
    else
      respond_to do |format|  
        format.html { redirect_back_or @user }
        format.js { render :js => "alert('Signing did not work');" } 
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #session[:user_id] = nil
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  def oauth_failure
    redirect_to signup_path
    #redirect wherever you want.
  end
  
  private
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
