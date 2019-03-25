class EnabledClientsController < ApplicationController
  before_action :set_enabled_client, only: [:show, :edit, :update, :destroy]

  # GET /enabled_clients
  # GET /enabled_clients.json
  def index
    @enabled_clients = EnabledClient.all
  end

  # GET /enabled_clients/1
  # GET /enabled_clients/1.json
  def show
  end

  # GET /enabled_clients/new
  def new
    @enabled_client = EnabledClient.new
     @clients =Client.all
  end

  # GET /enabled_clients/1/edit
  def edit
  end

  # POST /enabled_clients
  # POST /enabled_clients.json
  def create
    @enabled_client = EnabledClient.new(enabled_client_params)

    respond_to do |format|
      if @enabled_client.save
        format.html { redirect_to @enabled_client, notice: 'Enabled client was successfully created.' }
        format.json { render :show, status: :created, location: @enabled_client }
      else
        format.html { render :new }
        format.json { render json: @enabled_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enabled_clients/1
  # PATCH/PUT /enabled_clients/1.json
  def update
    respond_to do |format|
      if @enabled_client.update(enabled_client_params)
        format.html { redirect_to @enabled_client, notice: 'Enabled client was successfully updated.' }
        format.json { render :show, status: :ok, location: @enabled_client }
      else
        format.html { render :edit }
        format.json { render json: @enabled_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enabled_clients/1
  # DELETE /enabled_clients/1.json
  def destroy
    @enabled_client.destroy
    respond_to do |format|
      format.html { redirect_to enabled_clients_url, notice: 'Enabled client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enabled_client
      @enabled_client = EnabledClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enabled_client_params
      params.require(:enabled_client).permit(:enabled_person_id, :clients_id, :descripcion)
    end
end
