## Sinatra Review Application (CRUD)

This Sinatra Application is running using Postgres and assets are compiled and served with help from Sprockets. To get the application running do following:

# Installation
Clone repo to your local machine:
```
git clone git@github.com:scarsam/sinatra-review-site.git
```

Install dependencies:
```
Bundle install
```

Create database, seed database:
```
rake db:create:all
```

Run local server:
```
shotgun
```
Visit `http://127.0.0.1:9393/` in your browser.

