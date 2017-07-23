# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({username:'test', email:'test@tester.com', password: '1234', password_confirmation: '1234', id:1})

Contact.create({first_name: "Karl", last_name: "Hungus", email: "k_hung@treehornpictures.com", user_id:1, phone:"555-555-5555", note: "0/10, didn't even fix the cable"})
Contact.create({first_name: "Jesus", last_name: "Quintana", email: "thejesus@diosmio.man", user_id:1, phone:"555-555-5555", note: "You got a date wednesday"})
Contact.create({first_name: "Jeffery", last_name: "Lebowski", email:"thedude@abides.net", user_id:1, phone:"555-555-5555", note: "He can keep the rug"})
Contact.create({first_name: "Donald", last_name: "Kerabatsos", email:"SHUTTHEFUCKUP@DONNY.com", user_id:1, phone:"555-555-5555", note: "Out of his element"})
