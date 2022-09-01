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

### Adding Mailer

Add mailer to heroku project, using the free tier.

```
heroku addons:create mailgun:starter
```

Add SMTP config:
> at environment.rb

```
ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'yourapp.heroku.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
```

> at development.rb

```
config.action_mailer.delivery_method = :test
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
```

> at production.rb

```
config.action_mailer.delivery_method = :smtp
config.action_mailer.default_url_options = {
    :host => 'yourherokuapp.herokuapp.com/',
    :protocol => 'https'
  }
```
