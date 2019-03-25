# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = [
	{   email:'admin@admin.com',
		password:'1q2w3e',
		password_confirmation: '1q2w3e',
		name: 'Admin',
		surname: 'Admin',
		dni: '36666666',
		address: 'Direccion',
		user_type: 'admin' },

	{   email:'operador@user.com',
		password:'1q2w3e',
		password_confirmation: '1q2w3e',
		name: 'Operador',
		surname: 'Op',
		dni: '36666666',
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
		dni: '36666666',
		address: 'Direccion',
		user_type: 'user' }

]


user.each do | u | 
User.create(u)
end 