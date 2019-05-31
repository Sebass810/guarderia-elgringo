require 'prawn/table'
class BajadasPdf < Prawn::Document
	def initialize(bajadas, bajadas_client)
		super()
		@bajadas_client = bajadas_client.order("fecha DESC").all
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
		if @bajadas_client.length != 0
			descent_client
		end
	end

	def footer
	end

	#Método para almacenar y mostrar los registros del detalle de bajadas de clientes
	def descent_client_item_rows
	  [["Cliente", "Bote", "Persona", "fecha"]] +
	  @bajadas_client.map do |orden|
	    [ 	"#{orden.client.apellido + ', '+ orden.client.nombre} ",
	    	"#{orden.boat.nombre}", 
	    	"#{orden.enable_person.apellido + ', '+ orden.enable_person.nombre}  ",
	    	"#{orden.fecha.strftime("%d %B %y")}" ]
	  end
	end

	#Método que imprime la tabla de las bajadas de clientes que hay
	def descent_client
	  move_down 10
	  table descent_client_item_rows, :width => 540 do
	  	row(1..8).borders = []
	    row(0).font_style = :bold
	    columns(1..3).align = :right
	    self.header = true
	    self.column_widths = {0 => 200, 1 => 100, 2 => 140, 3 => 100}
	  end
	end

	#Método para almacenar y mostrar los registros del detalle de bajadas
	def descent_item_rows
	  [["Nombre", "Bote", "Motor", "Matricula","fecha"]] +
	  @bajadas.map do |orden|
	    [ 	"#{orden.apellido + ', ' + orden.nombre} ", 
	      	"#{orden.nombre_bote}", 
	      	"#{orden.motor_bote}  ",
	      	"#{orden.matricula_bote}  ",
	    	"#{orden.fecha.strftime("%d %B %y")}" 
	    ]
	  end
	end

	#Método que imprime la tabla de las bajadas
	def descent
	  move_down 80
	  table descent_item_rows, :width => 540 do
	  	row(1..8).borders = []
	    row(0).font_style = :bold
	    columns(1..4).align = :right
	    self.header = true
	    self.column_widths = {0 => 150, 1 => 100, 2 => 100, 3 => 100, 4 => 90}
	  end
	end
end
