task scrape: :environment do
  puts 'Sraping'
  NotificationsMailer.notify_success.deliver_now
end