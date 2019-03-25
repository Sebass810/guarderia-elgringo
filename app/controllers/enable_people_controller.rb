class EnablePeopleController < ApplicationController
  before_action :set_enable_person, only: [:show, :edit, :update, :destroy]

  # GET /enable_people
  # GET /enable_people.json
  def index
    @enable_people = EnablePerson.all
  end

  # GET /enable_people/1
  # GET /enable_people/1.json
  def show
  end

  # GET /enable_people/new
  def new
    @enable_person = EnablePerson.new
  end

  # GET /enable_people/1/edit
  def edit
  end

  # POST /enable_people
  # POST /enable_people.json
  def create
    @enable_person = EnablePerson.new(enable_person_params)

    respond_to do |format|
      if @enable_person.save
        format.html { redirect_to @enable_person, notice: 'Enable person was successfully created.' }
        format.json { render :show, status: :created, location: @enable_person }
      else
        format.html { render :new }
        format.json { render json: @enable_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enable_people/1
  # PATCH/PUT /enable_people/1.json
  def update
    respond_to do |format|
      if @enable_person.update(enable_person_params)
        format.html { redirect_to @enable_person, notice: 'Enable person was successfully updated.' }
        format.json { render :show, status: :ok, location: @enable_person }
      else
        format.html { render :edit }
        format.json { render json: @enable_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enable_people/1
  # DELETE /enable_people/1.json
  def destroy
    @enable_person.destroy
    respond_to do |format|
      format.html { redirect_to enable_people_url, notice: 'Enable person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enable_person
      @enable_person = EnablePerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enable_person_params
      params.require(:enable_person).permit(:clients_id, :nombre, :apellido, :dni, :estado)
    end
end
