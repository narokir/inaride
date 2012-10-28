class RidesController < ApplicationController
  
  # GET /rides
  # GET /rides.json	
  def index
    @rides = Ride.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rides }
    end
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
    @ride = Ride.find(params[:id])
    @json = Ride.find(params[:id]).to_gmaps4rails
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ride }
    end
  end

  # GET /rides/new
  # GET /rides/new.json
  def new
    if session[:user_id].present?
      @ride = Ride.new
      @user = @ride.build_user(params[:user])
    else
      respond_to do |format|
      format.html { redirect_to signin_url, notice: 'Please Sign in first' }
      format.json { render json: @ride }
      end
    end
  end

  # GET /rides/1/edit
  def edit
    @ride = Ride.find(params[:id])
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = current_user.rides.build(params[:ride])
    
    respond_to do |format|
      if @ride.save
        format.html { redirect_to @ride, notice: 'Ride was successfully created.' }
        format.json { render json: @ride, status: :created, location: @ride }
      else
        format.html { render action: "new" }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rides/1
  # PUT /rides/1.json
  def update
    @ride = Ride.find(params[:id])

    respond_to do |format|
      if @ride.update_attributes(params[:ride])
        format.html { redirect_to @ride, notice: 'Ride was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rides/1
  # DELETE /rides/1.json
  def destroy
    @ride = Ride.find(params[:id])
    @ride.destroy

    respond_to do |format|
      format.html { redirect_to rides_url }
      format.json { head :ok }
    end
  end
end
