class Client < ApplicationRecord
	has_many :boats, dependent: :destroy
	has_many :reservations, dependent: :destroy
	has_many :enable_persons, dependent: :destroy

	belongs_to :user
	
	def nombre_completo
		"#{nombre} #{apellido}"
	end
	validates :nombre, :apellido, :dni, :telefono, :celular, :estado, presence: true
	validates :dni, :telefono, :celular, numericality: { only_integer: true }
	#validates :dni, :telefono, :celular, numericality: true 
	validates :dni, length: { in: 7..8 }
	validates :celular, length: { in: 10..12 }
	validates :telefono, length: { in: 7..10 }
end
