task test: :environment do
  puts 'Testing'
  NotificationsMailer.notify_test.deliver_now
end