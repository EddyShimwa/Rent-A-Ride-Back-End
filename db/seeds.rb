admin = User.create(
    email: 'example@example.com',
    password: 'password',
    password_confirmation: 'password',
    name: 'John Doe'
)

## Cars
car1 = Car.create(name: "toyota", model: "v8", description: "the most confort car", rating: 2, price: 9.99, rent_per_day: 4, user_id: admin.id)

car1 = Car.create(name: "Benz Mercedes", model: "G-class", description: "the 
        most confort car", rating: 2, price: 7.99, rent_per_day: 4, user_id: admin.id)
    
        #Rentals 
firstRental = Rental.create(start_date: Date.today, end_date: Date.today + 7.days, city: "Lagos", price_per_day: 754, car_id: car1.id, user_id: admin.id)
            