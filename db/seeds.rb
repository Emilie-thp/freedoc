require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Speciality.destroy_all
SpeDoc.destroy_all

doctors = []
patients = []
cities = []
specialities = ['radiologie', 'dermatologie', 'neurologie', 'chirurgie']
special = []

10.times do |x|
	city = City.create(
	name: Faker::Address.city)
	cities << city
end

puts "Seeding done"

20.times do |x|
		doctor = Doctor.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		city_id: cities[rand(0..9)].id)
		doctors << doctor
end 
puts "Seedind done"


20.times do |x|
		patient = Patient.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		city_id: cities[rand(0..9)].id)
		patients << patient
end 
puts "Seeding done"


t1 = Time.parse("2019-10-25 14:40:34")
t2 = Time.parse("2021-12-23 00:00:00")

50.times do |x|
	Appointment.create(
		date: rand(t1..t2),
		city_id: cities[rand(0..9)].id,
		doctor_id: doctors[rand(0..19)].id,
		patient_id: patients[rand(0..9)].id)
end

puts "Seeding done"



specialities.each do |a|
	spe = Speciality.create(speciality: a)
	special << spe
end

puts "les 4 Specialités crées"


20.times do |x|
	SpeDoc.create(
		doctor_id: doctors[rand(0..19)].id,
		speciality_id: special[rand(0..3)].id)
		#il faut bien montrer le tableau des specialités OBJECTS et non le array de strings
end 

puts "Specialités par doctor crées"