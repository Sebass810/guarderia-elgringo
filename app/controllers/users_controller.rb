class UsersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

	def show
    
	end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Datos de usuario actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @user }
      else          
        format.html { render :edit, alert: 'Error al intentar actualizar los datos' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :dni, :address, :user_type)
    end
end
