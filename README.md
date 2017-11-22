## Sinatra Review Application (CRUD)

This Sinatra Application is running using Postgres and assets are compiled and served with help from Sprockets. Visit `https://sinatra-review-site.herokuapp.com/` to see live version. To get the application running locally do following:

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

Migrate database:
```
rake db:migrate
```

Seed database from `seeds.rb`:
```
rake db:seed
```

Run local server:
```
shotgun
```
Visit `http://127.0.0.1:9393/` in your browser.

