class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /boats
  # GET /boats.json
  def index
    if current_user.user_type == 'admin' or current_user.user_type == 'operador'
      @boats = Boat.all
      if params[:matricula].present?
        @boats = @boats.where('matricula like ?', "%#{params[:matricula]}%")
      end
    elsif can? :manage, Boat and current_user.user_type == 'user'
      @boats = Boat.where('client_id = ?', current_user.client.id)
      if params[:matricula].present?
        @boats = @boats.where('matricula like ?', "%#{params[:matricula]}%")
      end
    end
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
  end

  # GET /boats/new
  def new
    @boat = Boat.new
  end

  # GET /boats/1/edit
  def edit
  end

  # POST /boats
  # POST /boats.json
  def create
    @boat = Boat.new(boat_params)

    respond_to do |format|
      if @boat.save
        format.html { redirect_to @boat, notice: 'Registro creado con éxito.' }
        format.json { render :show, status: :created, location: @boat }
      else
        format.html { render :new }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
    respond_to do |format|
      if @boat.update(boat_params)
        format.html { redirect_to @boat, notice: 'El registro fue actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @boat }
      else
        format.html { render :edit }
        format.json { render json: @boat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'El registro fue destruido con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      params.require(:boat).permit(:client_id, :nombre, :matricula, :motor)
    end
end
