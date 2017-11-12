sam = User.create(name: "Sam", email: "sam@ojling.com", password: "hello123")
Review.create(name: "Food review", content: "This place was great", rating: 5, user_id: sam.id)
Review.create(name: "Car review", content: "This car was great", rating: 4, user_id: sam.id)