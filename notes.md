Review Crud App

A review has many comments. A comment belongs to a User and a Review. A user has many comment

Models
  User
    - has_many reviews
    - has_many comments
    - name
    - email
    - password
  Reviews
    - belongs_to user
    - has_many comments
    - name
    - content
    - rating
  Comments
    - belongs_to user
    - belongs_to review
    - content
    
Routes
  Home
    GET '/' :index
  User
    GET '/signup' :create_user 
    POST '/signup' redirect
    GET '/login' :login_user 
    POST '/login' redirect
    DELETE '/logout' redirect
  Reviews
    GET '/reviews' :index
    POST '/reviews' redirect
    GET '/reviews/:id' :show_review
    GET '/reviews/new' :create_review
    GET '/reviews/:id/edit' :edit_review
    PATCH '/reviews/:id' redirect
    DELETE '/reviews/:id/delete' redirect
  
Helpers
  - logged_in?
  - current_user
  
Concerns
  - slugify
  
Add
 - review.user.name