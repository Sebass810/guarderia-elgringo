class DescentsController < ApplicationController
  before_action :set_descent, only: [:show, :edit, :update, :destroy]

  # GET /descents
  # GET /descents.json
  def index
    @descents = Descent.all
  end

  # GET /descents/1
  # GET /descents/1.json
  def show
  end

  # GET /descents/new
  def new
    @descent = Descent.new
  end

  # GET /descents/1/edit
  def edit
  end

  # POST /descents
  # POST /descents.json
  def create
    @descent = Descent.new(descent_params)

    respond_to do |format|
      if @descent.save
        format.html { redirect_to @descent, notice: 'Descent was successfully created.' }
        format.json { render :show, status: :created, location: @descent }
      else
        format.html { render :new }
        format.json { render json: @descent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /descents/1
  # PATCH/PUT /descents/1.json
  def update
    respond_to do |format|
      if @descent.update(descent_params)
        format.html { redirect_to @descent, notice: 'Descent was successfully updated.' }
        format.json { render :show, status: :ok, location: @descent }
      else
        format.html { render :edit }
        format.json { render json: @descent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /descents/1
  # DELETE /descents/1.json
  def destroy
    @descent.destroy
    respond_to do |format|
      format.html { redirect_to descents_url, notice: 'Descent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_descent
      @descent = Descent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def descent_params
      params.require(:descent).permit(:nombre, :apellido, :dni, :nombre_bote, :matricula_bote, :motor_bote, :fecha)
    end
end
