class RidesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :new, :create, :destroy]
  # GET /rides
  # GET /rides.json	
  def index
    @rides = Ride.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /rides/1
  # GET /rides/1.json
  def show
    @ride = Ride.find(params[:id])
    @json = Ride.find(params[:id]).to_gmaps4rails
  end

  # GET /rides/new
  # GET /rides/new.json
  def new
      @ride = Ride.new
      @user = @ride.build_user(params[:user])
      @markers = '[
             {"description": "Origin",
              "lng": "-71.0597732",
              "lat": "42.3584308",
              "picture": "http://localhost:3000/assets/map_marker_green.png",
              "width": "55",
              "height": "41"
              },]'
      @json = @markers
  end

  # GET /rides/1/edit
  def edit
    @ride = Ride.find(params[:id])
  end

  # POST /rides
  # POST /rides.json
  def create
    @ride = current_user.rides.build(params[:ride])
    if @ride.save
      flash[:success] = "Nice! Ride was successfuly added"
      redirect_to @ride
    else
      format.json { render json: @ride.errors, status: :unprocessable_entity }
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
      format.html { redirect_to rides_url, notice: 'Ride was successfully deleted.' }
      format.json { head :ok }
    end
  end
  
  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in"
      end
    end
end
