class UserMailer < ActionMailer::Base
  default from: "announcer@inter-activity.ru"

  def newreg_email(user)   # Нотификатор Админу про новый запрос
    @user = user
    mail(to: "pijammer@gmail.com", subject: "New User on NoDelay!") 
  end

end
