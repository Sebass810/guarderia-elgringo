class Client < ApplicationRecord
	has_many :boats, dependent: :destroy
	has_many :reservations, dependent: :destroy

	belongs_to :user
	
	def nombre_completo
		"#{nombre} #{apellido}"
	end
	validates :nombre, :apellido, :dni, :TelǸfono, :celular, :estado, presence: true
	validates :dni, :TelǸfono, :celular, numericality: { only_integer: true }
	#validates :dni, :TelǸfono, :celular, numericality: true 
	validates :dni, length: { in: 7..8 }
	validates :celular, length: { in: 10..12 }
	validates :TelǸfono, length: { in: 7..10 }
end
