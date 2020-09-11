User.create(id: 1, full_name: "Administrator",         mobile: Faker::PhoneNumber.cell_phone, email: "admin@garage.com"                          , role: 'admin',    password: '123456' )
User.create(id: 2, full_name: "Mechanic-1", mobile: Faker::PhoneNumber.cell_phone, email: "mechanic-1@garage.com", role: 'mechanic', password: '123456' )
User.create(id: 3, full_name: "Mechanic-2", mobile: Faker::PhoneNumber.cell_phone, email: "mechanic-2@garage.com", role: 'mechanic', password: '123456' )
User.create(id: 4, full_name: "Customer-1", mobile: Faker::PhoneNumber.cell_phone, email: "customer-1@garage.com", role: 'customer', password: '123456' )
User.create(id: 5, full_name: "Customer-2", mobile: Faker::PhoneNumber.cell_phone, email: "customer-2@garage.com", role: 'customer', password: '123456' )
User.create(id: 6, full_name: "Customer-3", mobile: Faker::PhoneNumber.cell_phone, email: "customer-3@garage.com", role: 'customer', password: '123456' )
User.create(id: 7, full_name: "Mechanic-3", mobile: Faker::PhoneNumber.cell_phone, email: "mechanic-3@garage.com", role: 'mechanic', password: '123456' )
User.create(id: 8, full_name: "Mechanic-4", mobile: Faker::PhoneNumber.cell_phone, email: "mechanic-4@garage.com", role: 'mechanic', password: '123456' )

Service.create(id: 1,   name: "Annual Service",                 category: "base",   price: Faker::Commerce.price)
Service.create(id: 2,   name: "Major Service",                  category: "base",   price: Faker::Commerce.price)
Service.create(id: 3,   name: "Repair or Fault",                category: "base",   price: Faker::Commerce.price)
Service.create(id: 4,   name: "Major Repair",                   category: "base",   price: Faker::Commerce.price)
Service.create(id: 5,   name: "Wheel alignment",                category: "extra",  price: Faker::Commerce.price)
Service.create(id: 6,   name: "Grease and lubricat",            category: "extra",  price: Faker::Commerce.price)
Service.create(id: 7,   name: "Suspension",                     category: "extra",  price: Faker::Commerce.price)
Service.create(id: 8,   name: "Change the engine oil",          category: "extra",  price: Faker::Commerce.price)
Service.create(id: 9,   name: "Replace the oil filter",         category: "extra",  price: Faker::Commerce.price)
Service.create(id: 10,  name: "Replace the air filter",         category: "extra",  price: Faker::Commerce.price)

Part.create(id: 1,    name: "Engine motor oil",     price:Faker::Commerce.price)
Part.create(id: 2,    name: "Filter oil",           price:Faker::Commerce.price)
Part.create(id: 3,    name: "Filer air",            price:Faker::Commerce.price)
# Supension 
Part.create(id: 4,    name: "Control arms Upper",   price:Faker::Commerce.price)
Part.create(id: 5,    name: "Control arms Lower",   price:Faker::Commerce.price)
Part.create(id: 6,    name: "Control arms RH",      price:Faker::Commerce.price)
Part.create(id: 7,    name: "Control arms LH",      price:Faker::Commerce.price)
Part.create(id: 8,    name: "Ball Joints RH",       price:Faker::Commerce.price)
Part.create(id: 9,    name: "Ball Joints LH",       price:Faker::Commerce.price)
Part.create(id: 10,   name: "Bushings Upper",       price:Faker::Commerce.price)
Part.create(id: 11,   name: "Bushings Lower",       price:Faker::Commerce.price)
Part.create(id: 12,   name: "Stabilizer RH",        price:Faker::Commerce.price)
Part.create(id: 13,   name: "Stabilizer LH",        price:Faker::Commerce.price)
Part.create(id: 14,   name: "Tie Rod Ends LH",      price:Faker::Commerce.price)
Part.create(id: 15,   name: "Tie Rod Ends RH",      price:Faker::Commerce.price)
Part.create(id: 16,   name: "Rack Ends",            price:Faker::Commerce.price)
Part.create(id: 17,   name: "shock absorbers LH",   price:Faker::Commerce.price)
Part.create(id: 18,   name: "shock absorbers LH",   price:Faker::Commerce.price)
#frenos
Part.create(id: 19,   name: "Fornt Brake Pad",      price:Faker::Commerce.price)
Part.create(id: 20,   name: "Rear Brake Pad",       price:Faker::Commerce.price)
#Afinamiento
Part.create(id: 21,   name: "Spark Plugs",          price:Faker::Commerce.price)
Part.create(id: 22,   name: "Spark Plug Cable",     price:Faker::Commerce.price)
Part.create(id: 23,   name: "Inyector",             price:Faker::Commerce.price)
Part.create(id: 24,   name: "Module",               price:Faker::Commerce.price)
Part.create(id: 25,   name: "Ignition Coil",        price:Faker::Commerce.price)
Part.create(id: 26,   name: "Petrol Pump",          price:Faker::Commerce.price)
Part.create(id: 27,   name: "Filter Gas",           price:Faker::Commerce.price)
#Electric
Part.create(id: 28,   name: "Headlights",           price:Faker::Commerce.price)
Part.create(id: 29,   name: "Rear Lights",          price:Faker::Commerce.price)
Part.create(id: 30,   name: "Brake lights",         price:Faker::Commerce.price)
Part.create(id: 31,   name: "Fuses",                price:Faker::Commerce.price)
Part.create(id: 32,   name: "Relay",                price:Faker::Commerce.price)
Part.create(id: 33,   name: "Automotive cable",     price:Faker::Commerce.price)
Part.create(id: 34,   name: "Resistance",           price:Faker::Commerce.price)
Part.create(id: 35,   name: "Diode",                price:Faker::Commerce.price)
Part.create(id: 36,   name: "Transistor",                price:Faker::Commerce.price)
#Other
Part.create(id: 37,   name: "Tire",                 price:Faker::Commerce.price)
Part.create(id: 38,   name: "Battery",              price:Faker::Commerce.price)
Part.create(id: 39,   name: "Wiper Washer",         price:Faker::Commerce.price)
Part.create(id: 40,   name: "Refrigerant",          price:Faker::Commerce.price)

Booking.create(id: 1, date:  "2019-10-01", status: "booked",       vehicle_type: "car",            comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "diesel",    service_id: 1, mechanic_id: 2,     customer_id: 4)
Booking.create(id: 2, date:  "2019-08-01", status: "in_service",   vehicle_type: "motorbike",      comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "petrol",    service_id: 2, mechanic_id: 2,     customer_id: 4)
Booking.create(id: 3, date:  "2019-03-03", status: "fixed",        vehicle_type: "small_van",      comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "hybrid",    service_id: 3, mechanic_id: 3,     customer_id: 6)
Booking.create(id: 4, date:  "2019-04-04", status: "collected",    vehicle_type: "small_bus",      comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "electric",  service_id: 2, mechanic_id: 3,     customer_id: 5)
Booking.create(id: 5, date:  "2019-05-05", status: "unrepairable", vehicle_type: "otros",          comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "diesel",    service_id: 2, mechanic_id: 3,     customer_id: 5)
Booking.create(id: 6, date:  "2019-01-01", status: "collected",    vehicle_type: "car",            comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "diesel",    service_id: 1, mechanic_id: 2,     customer_id: 4)
Booking.create(id: 7, date:  "2019-02-02", status: "unrepairable", vehicle_type: "motorbike",      comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "petrol",    service_id: 2, mechanic_id: 2,     customer_id: 4)
Booking.create(id: 8, date:  "2019-02-02", status: "fixed",        vehicle_type: "motorbike",      comments: Faker::Lorem.sentence, vehicle_number_plate: Faker::Vehicle.license_plate, vehicle_model: Faker::Vehicle.model, vehicle_brand: Faker::Vehicle.make, vehicle_engine: "petrol",    service_id: 2, mechanic_id: 2,     customer_id: 4)

Booking.find(1).service_ids = [5, 6]
Booking.find(2).service_ids = [7, 8]
Booking.find(3).service_ids = [9, 10]
Booking.find(4).service_ids = [5, 10]
Booking.find(5).service_ids = [6, 9]
Booking.find(6).service_ids = [9, 7]
Booking.find(7).service_ids = [5, 8]
Booking.find(8).service_ids = [6, 9]

Booking.find(1).part_ids = [14, 15, 16, 17, 18, 37]
Booking.find(2).part_ids = [1, 2, 3]
Booking.find(3).part_ids = [2, 3]
Booking.find(4).part_ids = [3, 37]
Booking.find(5).part_ids = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
Booking.find(6).part_ids = [1, 2]
Booking.find(7).part_ids = [21, 30]
Booking.find(8).part_ids = [18, 25]