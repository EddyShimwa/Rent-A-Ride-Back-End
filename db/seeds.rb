# User
admin = User.create(
    email: 'example@example.com',
    password: 'password',
    name: 'John Doe'
)   

# Cars

car1 = Car.create(name: "Benz Mercedes", model: "GLK350", description: "Experience the epitome of luxury and performance with the Benz Mercedes GLK350. This exceptional SUV combines elegant design, advanced technology, and unparalleled comfort. Don't miss the opportunity to drive this remarkable vehicle.", rating: 4, price: 87.8, rent_per_day: 87.99, user_id: admin.id)
frontImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23940877/4.jpg?width=400&ratio=16/9", car_id: car1.id)
sideImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23940877/1.jpg?width=400&ratio=16/9", car_id: car1.id)
backImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23370414/2.jpg?width=2400&ratio=16/9", car_id: car1.id)

car2 = Car.create(name: "Benz Mercedes", model: "E53 AMG", description: "Introducing the Benz Mercedes E53 AMG, a stunning blend of luxury and performance. This high-performance sedan offers exhilarating driving dynamics with its powerful engine and precise handling.Drive to experience the ultimate driving pleasure.", rating: 2, price: 100, rent_per_day: 80.99, user_id: admin.id)
frontImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23370414/4.jpg?width=2400&ratio=16/9", car_id: car2.id)
sideImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23370414/3.jpg?width=2400&ratio=16/9", car_id: car2.id)
backImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23370414/2.jpg?width=2400&ratio=16/9", car_id: car2.id)

car3 = Car.create(name: "Chevrolet Silverado", model: "1500 Custom", description: "Popular full-size pickup truck manufactured by General Motors under the Chevrolet brand.", rating: 2, price: 70.6, rent_per_day: 98.99, user_id: admin.id)
frontImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23966352/1.jpg?width=2400&ratio=16/9", car_id: car3.id)
sideImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23966352/3.jpg?width=2400&ratio=16/9", car_id: car3.id)
backImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23966352/8.jpg?width=2400&ratio=16/9", car_id: car3.id)

car4 = Car.create(name: "Range Rover", model: "Sport SE Diesel", description: "Popular full-size pickup truck manufactured by General Motors under the Range Rover brand.", rating: 2, price: 78.6, rent_per_day: 98.99, user_id: admin.id)
frontImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23064930/4.jpg?width=400&ratio=16/9", car_id: car4.id)
sideImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23064930/3.jpg?width=400&ratio=16/9", car_id: car4.id)
backImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23064930/8.jpg?width=400&ratio=16/9", car_id: car4.id)

car5 = Car.create(name: "Audi ", model: "Q5 Premium Plus", description: "The Optima LX is typically equipped with a 2.4-liter four-cylinder engine, providing a balance of power and fuel efficiency. It is front-wheel drive and may come with a six-speed automatic transmission.", rating: 2, price: 78.6, rent_per_day: 98.99, user_id: admin.id)
frontImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23992275/4.jpg?width=2400&ratio=16/9", car_id: car5.id)
sideImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23992275/3.jpg?width=2400&ratio=16/9", car_id: car5.id)
backImage = Image.create(url: "https://img2.carmax.com/img/vehicles/23992275/2.jpg?width=1600&ratio=16/9", car_id: car5.id)