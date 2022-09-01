# README

Since this project is more 'free' than  the others, some of the proccess will be documented here.

### Setting up Authentication System & Style

Add the following gems:

```
gem 'devise'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'jquery-rails'
```

Install devise:

```
rails generate devise:install

rails generate devise User
```
Make user confirmable:
> In the generated migration file, uncomment the 4 lines under confirmable

```
t.string :confirmation_token
t.datetime :confirmed_at
t.datetime :confirmation_sent_at
t.string :unconfirmed_email
```

Update User model to be confirmable:
> Add :confirmable, after :registerable

```
:confirmable,
```

Run migration:

```
rake db:migrate
```

Add auth requirement to application:
> Add before_action to application_controller.rb

```
before_action :authenticate_user!
```

Leave the index page free from auth requirement:
> Add skip_before_action to welcome_controller.rb

```
skip_before_action :authenticate_user!, only: [:index]
```

Install Boostrap themed styling using followgin commands:

```

rails generate bootstrap:install static

# select Y to force override after hitting enter
rails generate bootstrap:layout application

rails generate devise:views:locale en

rails generate devise:views:bootstrap_templates
```

Add js to be precompiled in production:
> at assets/config/manifest.js

```
//= link application.js
```

Remove all the favicon tags:
> at application.html.erb
