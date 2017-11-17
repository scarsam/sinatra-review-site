Review Crud App

Models
  User
    - has_many reviews
    - name
    - email
    - password
  Reviews
    - belongs_to users
    - name
    - content
    - rating
    
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