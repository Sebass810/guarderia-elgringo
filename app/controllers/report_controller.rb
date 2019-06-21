class ReportController < ApplicationController
  
  def index

		if params["fecha_desde"].present? and params["fecha_hasta"].present?
			if params["fecha_desde"] > params["fecha_hasta"]
				respond_to do |format|
        	format.html { redirect_to '/report/index', alert: 'Error al ingresar las fechas.' }
        end
			end
		end
  	@bajadas_client = DescentClient.all

		if params["fecha_desde"].present?
			@bajadas_client = @bajadas_client.where('fecha >= ?', params["fecha_desde"])
		end
		if params["fecha_hasta"].present?
			@bajadas_client = @bajadas_client.where('fecha <= ?', params["fecha_hasta"])
		end


  end

  def estadisticas_bajadas
		@bajadas_client = DescentClient.all

		if params["fecha_desde"].present?
			@bajadas_client = @bajadas_client.where('fecha >= ?', params["fecha_desde"])
		end
		if params["fecha_hasta"].present?
			@bajadas_client = @bajadas_client.where('fecha <= ?', params["fecha_hasta"])
		end
			
		respond_to do |format|
			format.html
			format.pdf do 
				pdf = BajadasPdf.new(@bajadas, @bajadas_client)
				send_data pdf.render, filename: 'estadisticasEstados.pdf', type: 'application/pdf', disposition: "inline"
			end
		end
	end

end
