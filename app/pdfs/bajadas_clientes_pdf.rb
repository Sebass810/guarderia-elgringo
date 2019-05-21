require 'prawn/table'
class BajadasClientesPdf < Prawn::Document
	def initialize(bajadas)
		super()
		@bajadas = bajadas.order("fecha DESC").all
		@titulo = "Lista de bajadas"

    	header
    	body
    	footer
	end

	def header
		text "#{Date.today.strftime("%d %B %Y")}", align: :right
		text @titulo, align: :center, size: 20
		# move_down 10
	end

	def body
		if @bajadas.length != 0
			descent
		else
			text "No se registro bajas de clientes en las fechas seleccionadas"
		end
	end

	def footer
	end

	#Método para almacenar y mostrar los registros del detalle de bajadas de clientes
	def descent_client_item_rows
	  [["Cliente", "Bote", "Persona autorizada", "fecha"]] +
	  @bajadas.map do |orden|
	    [ 	"#{orden.client.apellido + ', '+ orden.client.nombre} ",
	    	"#{orden.boat.nombre}", 
	    	"#{orden.enable_person.apellido + ', '+ orden.enable_person.nombre}  ",
	    	"#{orden.fecha.strftime("%d %B %y")}" ]
	  end
	end

	#Método que imprime la tabla de las bajadas de clientes que hay
	def descent
	  move_down 10
	  table descent_client_item_rows, :width => 540 do
	  	row(1..8).borders = []
	    row(0).font_style = :bold
	    columns(1..3).align = :right
	    self.header = true
	    self.column_widths = {0 => 200, 1 => 100, 2 => 140, 3 => 100}
	  end
	end
end
