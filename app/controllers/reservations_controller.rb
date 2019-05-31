class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_client, only: [:get_client]
  before_action :verificar, only: [:destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    user_type = current_user.user_type
    if  user_type == 'admin' or user_type == 'operador'
      @reservations = Reservation.all
    elsif user_type == 'user' and !current_user.client.nil?
      id = current_user.client.id
      @reservations = Reservation.where('client_id = ?', id)
    else
      redirect_to(root_path)
    end
  end


  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    if can? :new, Reservation
      @reservation = Reservation.new
      @boxes = Box.where('state = 0')
      if current_user.user_type == 'user'
        @client = Client.where('id = ?', current_user.client.id)
      end
    elsif current_user.user_type == 'user'
      redirect_to(new_client_path)
    end
  end

  # GET /reservations/1/edit
  def edit
    @box_id = @reservation.box_id
    @boxes = Box.where('id = ?',@box_id)
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    respond_to do |format|
      if @reservation.save
        case @reservation.estado
          when 0
            @reservation.box.state = 2
            @reservation.box.save
          when 1
            @reservation.box.state = 1
            @reservation.box.save
          when 2
            @reservation.box.state = 0
            @reservation.box.save
        end
        format.html { redirect_to @reservation, notice: 'Reservación creada con exito.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        @boxes = Box.where('state = 0')
        if current_user.user_type == 'user'
          @client = Client.where('id = ?', current_user.client.id)
        end
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
        case @reservation.estado
          when 0
          when 1
            @reservation.box.state = 1
            @reservation.box.save
          when 2
            @reservation.box.state = 0
            @reservation.box.save
        end
        format.html { redirect_to @reservation, notice: 'Reservación actualizada.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        @box_id = @reservation.box_id
        @boxes = Box.where('id = ?',@box_id)
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    actualiza_box
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservación suspendida.' }
      format.json { head :no_content }
    end
  end

  def get_client

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def set_client
      @client = Client.where('id = ? or dni like ? ',params[:id], "#{params[:id]}%")
      if @client[0].nil?
        @client = Client.new
      else
        @client = @client[0]
      end
    end

    def verificar
      reservation1 = Reservation.find(params[:id])
      reservation2 = Reservation.where(box_id: reservation1.box_id)
      reservation2 = reservation2.last()
      if reservation1.id == reservation2.id
        @box = @reservation.box
      end
    end

    def actualiza_box
      @box.state = 0
      @box.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:client_id, :box_id, :fecha_desde, :fecha_hasta, :estado)
    end
end
