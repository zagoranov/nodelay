git add .
git commit -m %1
git push heroku master

IF "%2"=="" GOTO End

heroku run rake db:migrate

:End