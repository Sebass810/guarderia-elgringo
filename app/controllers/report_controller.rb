class ReportController < ApplicationController
  
  def index
  end

  def estadisticas_bajadas_clientes
  	@bajadas = DescentClient.where('client_id = ?', current_user.id)
  	respond_to do |format|
			format.html
			format.pdf do 
				pdf = BajadasClientesPdf.new(@bajadas)
				send_data pdf.render, filename: 'estadisticasEstados.pdf', type: 'application/pdf', disposition: "inline"
			end
		end
  end

  def estadisticas_bajadas
		@bajadas_client = DescentClient.all
		@bajadas = Descent.all
		if params["fecha_desde"].present?
			@bajadas_client = @bajadas_client.where('fecha >= ?', params["fecha_desde"])
			@bajadas = @bajadas.where('fecha >= ?', params["fecha_desde"])
		end
		if params["fecha_hasta"].present?
			@bajadas_client = @bajadas_client.where('fecha <= ?', params["fecha_hasta"])
			@bajadas = @bajadas.where('fecha <= ?', params["fecha_hasta"])
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
