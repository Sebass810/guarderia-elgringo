class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    if user_signed_in?
      if can? :manage, Reservation
        @reservations = Reservation.all
      elsif !current_user.client.nil?
        @reservations = Reservation.where('client_id = ?', current_user.client.id)
      else
        redirect_to(new_client_path)
      end
    else
      redirect_to(root_path)
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @boxes = Box.where('state = 0')
    @boats = Boat.where('client_id = ?', current_user.client.id)
  end

  # GET /reservations/new
  def new
    if !current_user.client.nil?
      @reservation = Reservation.new
      @boxes = Box.where('state = 0')
      @boats = Boat.where('client_id = ?', current_user.client.id)
    else
      redirect_to(new_client_path)
    end
  end

  # GET /reservations/1/edit
  def edit
    @boxes = Box.where('state = 0')
    @boats = Boat.where('client_id = ?', current_user.client.id)
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    respond_to do |format|
      if @reservation.save
        @reservation.box.state = 1
        @reservation.box.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        @boxes = Box.where('state = 0')
        @boats = Boat.where('client_id = ?', current_user.client.id)
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:client_id, :box_id, :fecha_desde, :fecha_hasta, :estado)
    end
end
