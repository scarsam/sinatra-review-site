sam = User.create(name: "Sam", email: "sam@ojling.com", password: "hello123")
Review.create(name: "Food review", category: "Resturant", content: "This place was great", rating: 5, user_id: sam.id)
Review.create(name: "Car review", category: "Cars", content: "This car was great", rating: 4, user_id: sam.id)