class DescentClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_descent_client, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente, only: [:show_cliente]
  before_action :set_boat, only: [:show_boat]
  before_action :set_enable_person, only: [:show_enable_person]
  # GET /descent_clients
  # GET /descent_clients.json
  def index
    @user_type = current_user.user_type
    if @user_type == 'admin' or @user_type == 'operador'
      @descent_clients = DescentClient.all
    elsif @user_type == 'user' and !current_user.client.nil?
      @descent_clients = DescentClient.where('client_id = ? ', current_user.client.id)
    end

  end

  # GET /descent_clients/1
  # GET /descent_clients/1.json
  def show
  end

  def show_cliente
  end

  def show_boat
  end

  def show_enable_person
  end

  # GET /descent_clients/new
  def new
    @descent_client = DescentClient.new
  end

  # GET /descent_clients/1/edit
  def edit
  end

  # POST /descent_clients
  # POST /descent_clients.json
  def create
    @descent_client = DescentClient.new(descent_client_params)

    respond_to do |format|
      if @descent_client.save
        format.html { redirect_to @descent_client, notice: 'Descent client was successfully created.' }
        format.json { render :show, status: :created, location: @descent_client }
      else
        format.html { render :new }
        format.json { render json: @descent_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descent_clients/1
  # PATCH/PUT /descent_clients/1.json
  def update
    respond_to do |format|
      if @descent_client.update(descent_client_params)
        format.html { redirect_to @descent_client, notice: 'Descent client was successfully updated.' }
        format.json { render :show, status: :ok, location: @descent_client }
      else
        format.html { render :edit }
        format.json { render json: @descent_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descent_clients/1
  # DELETE /descent_clients/1.json
  def destroy
    @descent_client.destroy
    respond_to do |format|
      format.html { redirect_to descent_clients_url, notice: 'Descent client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descent_client
      @descent_client = DescentClient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descent_client_params
      params.require(:descent_client).permit(:client_id, :boat_id, :enable_person_id, :fecha)
    end

    def set_cliente
      @cliente = Client.where('id = ?', params[:id])      
      if @cliente[0].nil? #or @cliente[0].user.state != 1
        @cliente = Client.new
      else
        @cliente = @cliente[0]
      end
    end

    def set_boat
      @boat = Boat.where('id = ? and client_id = ? ',params[:id], params[:client_id])
      if @boat[0].nil? #or @cliente[0].user.state != 1
        @boat = Boat.new
      else
        @boat = @boat[0]
      end
    end

    def set_enable_person
      @enable_person = EnablePerson.where('id = ? and client_id = ? ',params[:id], params[:client_id])
      if @enable_person[0].nil? #or @cliente[0].user.state != 1
        @enable_person = EnablePerson.new
      else
        @enable_person = @enable_person[0]
      end
    end
end
