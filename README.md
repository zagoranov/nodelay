# Simple task manager
Ruby on rails + Sqlite

## Env stuff
* Interface mostly in russian, sorry.
* You should fill config/secret.yml with secret key bases
* If you want use telegtam notifications, you should fill app/controller/application_controller.rb telegram chat data in method def pontificate(mess)
* Replace my email with yours in app/mailer/mailers
* Mail account settings for email announcing in config/environments

## Preparing to start
```console
bundle install
rake db:migrate
bundle exec rake rails:update:bin
```

## Run
```console
rails s
```

## Requires
* ruby 2.3.3
* rails 4.2.1
