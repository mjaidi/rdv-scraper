class NotificationsMailer < ApplicationMailer
  def notify_success(mail)
    p 'notify' + mail
    mail(
      to:       mail,
      subject:  "Rdv Overts!"
    )
  end

  def notify_test
    mail(
      to:       'majid.jaidi@gmail.com',
      subject:  "Test mail"
    )
  end
end

