class NotificationsMailer < ApplicationMailer
  def notify_success
    mail(
      to:       'majid.jaidi@gmail.com',
      subject:  "Rdv Disponible!"
    )
  end

  def notify_test
    mail(
      to:       'majid.jaidi@gmail.com',
      subject:  "Test mail"
    )
  end
end

