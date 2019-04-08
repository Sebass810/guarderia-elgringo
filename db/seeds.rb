# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
	{   email:'admin@admin.com',
		password:'1q2w3e',
		password_confirmation: '1q2w3e',
		name: 'Admin',
		surname: 'Admin',
		dni: '30909090',
		address: 'Direccion',
		user_type: 'admin' },

	{   email:'operador@user.com',
		password:'1q2w3e',
		password_confirmation: '1q2w3e',
		name: 'Operador',
		surname: 'Op',
		dni: '36080808',
		address: 'Direccion',
		user_type: 'operador' },

	{   email:'user1@user.com',
		password:'1q2w3e',
		password_confirmation: '1q2w3e',
		name: 'User 1',
		surname: 'User',
		dni: '36666666',
		address: 'Direccion',
		user_type: 'user' },
	{   email:'user2@user.com',
		password:'1q2w3e',
		password_confirmation: '1q2w3e',
		name: 'Usuario 2',
		surname: 'Usuario',
		dni: '30887777',
		address: 'Direccion',
		user_type: 'user' }

]

users.each do | u | 
	User.create(u)
end


boxes = [
	{
		descripcion: '4mts X 2mtrs',
      	tamano: 'Pequeño'
	},
	{
		descripcion: '4mts X 2mtrs',
      	tamano: 'Pequeño'
	},
	{
		descripcion: '6mts X 3mtrs',
      	tamano: 'Mediano'
	},
	{
		descripcion: '6mts X 3mtrs',
      	tamano: 'Mediano'
	},
	{
		descripcion: '10mts X 5mtrs',
      	tamano: 'Grande'
	},
	{
		descripcion: '10mts X 5mtrs',
      	tamano: 'Grande'
	},
]

boxes.each do | b |
	Box.create(b)
end

clients = [
	{
		user_id: 3,
		nombre: 'Cliente 1',
    	apellido: 'User 1',
    	dni: '30999888',
    	telefono: '3794 458888',
    	celular: '3794 909090'
	}
]

clients.each do | c |
	Client.new(c)
end

boats = [
	{
		client_id: 1,
      	nombre: 'Bote del cliente 1',
      	matricula: '345CFD',
      	motor: 'LJJ3J2K4KSO',
      	estado: 0
	},
]

boats.each do | boat |
	Boat.create(boat)
end