task scrape: :environment do
  puts 'Sraping'
  require 'open-uri'
  require 'nokogiri'
  require 'mechanize'

  # URL = 'http://www.herault.gouv.fr/booking/create/15253'
  URL = 'http://www.herault.gouv.fr/booking/create/15259'

  agent = Mechanize.new { |agent| agent.user_agent_alias = 'Windows Chrome'}
  page = agent.get(URL)
  form = page.form('create')
  form.checkbox_with(:name => 'condition').check
  page = agent.submit(form, form.buttons.first)
  p page.search("[name='create']").to_s
  # p page.search("#global_Booking").to_s

  # if page.search("#global_Booking").to_s.match("Cette page n'est pas disponible pour le moment ! Elle sera très prochainement remise en ligne.")
  if (page.search("[name='create']").to_s.match(/Il n'existe plus de plage horaire libre pour votre demande de rendez-vous/))
    puts 'nothing found'
  else
    puts 'rdv found'
    NotificationsMailer.notify_success('majid.jaidi@gmail.com').deliver_now
    NotificationsMailer.notify_success('yasminelaraki91@gmail.com').deliver_now
  end
end