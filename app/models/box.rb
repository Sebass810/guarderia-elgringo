class Box < ApplicationRecord
	
	validates :descripcion, :tamano, presence: true

	def nombreb
		"#{descripcion}"
	end
	
end
